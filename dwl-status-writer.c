#include <dirent.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

static char *capacity_path = "/sys/class/power_supply/BAT0/capacity";

static int read_battery_capacity(void)
{
    FILE *f = fopen(capacity_path, "r");
    if (!f)
        return -1;

    int capacity;
    if (fscanf(f, "%d", &capacity) != 1)
        capacity = -1;

    fclose(f);
    return capacity;
}

int main(void)
{
    const char *fdstr = getenv("STATUS_FD");
    if (!fdstr) {
        fprintf(stderr, "STATUS_FD is not set\n");
        return 1;
    }

    int fd = atoi(fdstr);

    FILE *out = fdopen(fd, "w");
    if (!out) {
        perror("fdopen");
        return 1;
    }

    setvbuf(out, NULL, _IOLBF, 0);

    while (1) {
        time_t now = time(NULL);
        struct tm tm;
        char timestr[64];

        localtime_r(&now, &tm);
        strftime(timestr, sizeof(timestr), "%a %-d %b %H:%M", &tm);

        int bat = read_battery_capacity();

        if (bat >= 0)
            fprintf(out, " Bat: %d%%  |  %s \n", bat, timestr);
        else
            fprintf(out, " Bat: --%%  |  %s \n", timestr);

        fflush(out);
        sleep(5);
    }
}
