/* (c) 2017 Tim Prince. All rights reserved worldwide. */

#include "wavegen.h"

#include <cmath>
#include <unistd.h>

using namespace wavegen;

extern "C" int printf(const char *, ...);

void sweep(
    device& dev,
    output_waveform ow,
    uint32_t start,
    uint32_t end,
    uint32_t step,
    uint32_t delay)
{
    uint32_t freq = start;
    channel_id channel = 1;
    dev.setFrequency(0, freq);
    while (freq <= end)
    {
        printf("setFrequency %d %d\n", channel, freq);
        freq += step;
        dev.setFrequency(channel, freq);

        channel = !channel;
        printf("setOutput %d\n", channel);
        dev.setOutput(ow, channel);
        usleep(delay);
    }
}

int main()
{
    device dev;

    while (1) {
        sweep(dev, output_waveform::sinusoid, 0, 44000, 10, 100000);
    }
}
