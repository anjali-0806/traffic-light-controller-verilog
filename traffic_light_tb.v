`timescale 1ns / 1ps

module traffic_light_tb;

    reg clk;
    reg reset;

    wire red;
    wire yellow;
    wire green;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Generate clock
    always #5 clk = ~clk;

    // Test
    initial begin

        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        #50;
        $finish;

    end

endmodule