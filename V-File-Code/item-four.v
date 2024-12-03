module Item_Four(nickel_in, dime_in, clock, nickel_out, dispense);
    input nickel_in, dime_in, clock;
    output reg nickel_out, dispense;

    reg [7:0] current_state, next_state;

    localparam  S0  = 8'b00000001,
                S5  = 8'b00000010,
                S10 = 8'b00000100,
                S15 = 8'b00001000,
                S20 = 8'b00010000,
                S25 = 8'b00100000,
                S30 = 8'b01000000,
                S35 = 8'b10000000;

    // State update logic
    always @(posedge clock) begin
        current_state <= next_state;
    end

    // Combinational logic for next state and outputs
    always @(*) begin
        // Default assignments
        next_state = current_state;  // Default to hold the current state
        {nickel_out, dispense} = 2'b00; // Default output values

        case (current_state)
            S0: begin
                if (nickel_in) begin
                    next_state = S5;  
                end else if (dime_in) begin
                    next_state = S10;
                end
            end
           
            S5: begin
                if (nickel_in) begin
                    next_state = S10;
                end else if (dime_in) begin
                    next_state = S15;
                end
            end
           
            S10: begin
                if (nickel_in) begin
                    next_state = S15;
                end else if (dime_in) begin
                    next_state = S20;
                end
            end
           
            S15: begin
                if (nickel_in) begin
                    next_state = S20;
                end else if (dime_in) begin
                    next_state = S25;
                    {nickel_out, dispense} = 2'b01; // Output when transitioning to S25
                end
            end
           
            S20: begin
                if (nickel_in) begin
                    next_state = S25;
                    {nickel_out, dispense} = 2'b01; // Output when transitioning to S25
                end else if (dime_in) begin
                    next_state = S30;
                    {nickel_out, dispense} = 2'b01; // Output when transitioning to S30
                end
            end
           
            S25: begin
                if (nickel_in) begin
                    next_state = S30;
                    {nickel_out, dispense} = 2'b01; // Output when transitioning to S30
                end else if (dime_in) begin
                    next_state = S35;
                    {nickel_out, dispense} = 2'b11; // Output when transitioning to S35
                end
            end
           
            S30: begin
                next_state = S0;
            end

            S35: begin
                next_state = S0;
            end

            default: begin
                next_state = S0;
            end
        endcase
    end
endmodule