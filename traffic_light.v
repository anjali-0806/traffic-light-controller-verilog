module traffic_light (
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);
parameter RED_STATE    = 2'b00;
parameter GREEN_STATE  = 2'b01;
parameter YELLOW_STATE = 2'b10;

reg [1:0] state;
always @(posedge clk or posedge reset) begin

    if (reset)
        state <= RED_STATE;

    else begin

        case (state)

            RED_STATE:
                state <= GREEN_STATE;

            GREEN_STATE:
                state <= YELLOW_STATE;

            YELLOW_STATE:
                state <= RED_STATE;

            default:
                state <= RED_STATE;

        endcase

    end

end
always @(*) begin

    // Initially turn all lights OFF
    red = 0;
    yellow = 0;
    green = 0;

    case (state)

        RED_STATE:
            red = 1;

        GREEN_STATE:
            green = 1;

        YELLOW_STATE:
            yellow = 1;

    endcase

end

endmodule