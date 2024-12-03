module Item_One(nickel_in, dime_in, clock, nickel_out, dispense);
    input nickel_in, dime_in, clock;
    output reg nickel_out, dispense;
    reg [4:0] current_state, next_state;

    // Defining the states
    localparam  S0  = 5'b00001,
                S5  = 5'b00010,
                S10 = 5'b00100,
                S15 = 5'b01000,
                S20 = 5'b10000;

    // A state will change when there is a positive edge in clock or reset
    always @(posedge clock) begin
        current_state <= next_state;
    end

    // Defining the relationships among the states
    always @(*) begin
        case (current_state)
            S0: begin
                if (nickel_in) begin
                    next_state = S5;
                    {nickel_out, dispense} = 2'b00;
                end else if (dime_in) begin
                    next_state = S10;
                    {nickel_out, dispense} = 2'b00;
                end else begin
                    next_state = S0;
                    {nickel_out, dispense} = 2'b00;
                end
            end
           
            S5: begin
                if (nickel_in) begin
                    next_state = S10;
                    {nickel_out, dispense} = 2'b00;
                end else if (dime_in) begin
                    next_state = S15;
                    {nickel_out, dispense} = 2'b01;
                end else begin
                    next_state = S5;
                    {nickel_out, dispense} = 2'b00;
                end
            end
           
            S10: begin
                if (nickel_in) begin
                    next_state = S15;
                    {nickel_out, dispense} = 2'b01;
                end else if (dime_in) begin
                    next_state = S20;
                    {nickel_out, dispense} = 2'b11;
                end else begin
                    next_state = S10;
                    {nickel_out, dispense} = 2'b00;
                end
            end
           
            S15: begin
                next_state = S0;
                {nickel_out, dispense} = 2'b00;
            end
           
            S20: begin
                next_state = S0;
                {nickel_out, dispense} = 2'b00;
            end

            default: begin
                next_state = S0;
                {nickel_out, dispense} = 2'b00;
            end
        endcase
    end
endmodule