# FIR Filter Architectures

## 1. Normal FIR — Data-Broadcast Structure

In the reference architecture, the input sample is broadcast to three coefficient multipliers. Delay registers and adders combine the weighted samples to produce the output.

**Main components:** multipliers, delay registers, adders.

## 2. Parallel FIR — Block Processing

The reference architecture processes three input samples per block and produces three outputs: `y(3k)`, `y(3k+1)`, and `y(3k+2)`.

The parallel structure distributes multiplication and addition across multiple arithmetic paths.

**Main components:** parallel multiplier paths, adders, and delay registers.

## Implementation Note

These descriptions summarize the reference architectures. Consult the VHDL source files in `normal-fir/` and `parallel-fir/` for the exact implemented connections.
