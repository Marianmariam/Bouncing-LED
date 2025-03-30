Bouncing LED
<br>
The goal of this project is to design a simple bouncing LED system using Verilog and the Terasic DE10-Lite FPGA board. The system employs a 10-bit LED register to control the movement of the LEDs, which bounce back and forth across the 10 LED positions. The direction of movement is determined by the current position of the LEDs, changing when the LEDs reach either the far-left or far-right positions. Additionally, a clock divider generates a slower enable signal to control the LED updates at a rate of approximately 25 million ticks(0.5 seconds), ensuring smooth and controlled movement.

![image alt](https://i.imgur.com/65ablh2.gif)
