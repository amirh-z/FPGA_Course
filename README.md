# FPGA Course
Here you can find some of the codes I've written for my FPGA class:
- 1: Synchronous Presettable 4-bit Binary Counter (74163)
- 2: 3-to-8 Line Decoder (74138)
- 3: A Frequency Divider</br>
  The entity has two inputs, <kbd>clk_in</kbd> and <kbd>ctrl</kbd>. First one determines the input clock which will be 100 times less than the output clock (<kbd>clk_out</kbd>) and the latter is a 4-bit input taking a value between zero to 10. The given value then will be multiplied by 10 to determine the duty cycle of the output clock.
- 4: A Stopwatch</br>
  The entity has a clock input and two inputs to start and reset the timer. 
- 4: A 256-byte Dual Port RAM
- 5: A LIFO Memory
- 6: An Implementation of SPI Protocol
- 7: A Convolution Calculator</br>
  This program is intended to solve this equation: $y = \Sigma_{i=1}^{10}a_i x_i = a_1 x_1 + a_2 x_2 + ... + a_{10} x_{10}$ </br>
  Below, you can see its block diagram implementation:
  

<img width="712" alt="BD" src="https://github.com/amirh-z/FPGA_Course/assets/22748718/763b6c90-0871-4915-9c71-2116cc2e88d6">
