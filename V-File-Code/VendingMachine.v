// Main Vending Machine Module
module VendingMachine(
    input a, b, c, d, nickel_in, dime_in, clock,
    output reg nickel_out, dispense
);

    // Wires for nickel_out and dispense from item modules
    wire No1, No2, No3, No4;
    wire D1, D2, D3, D4;

    // Item selection encoded as a 4-bit number
    wire [3:0] item_number;
    assign item_number = {d, c, b, a};

    // Instantiate modules for each item
    Item_One   IO(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .nickel_out(No1), .dispense(D1));
    Item_Two   ITW(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .nickel_out(No2), .dispense(D2));
    Item_Three ITH(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .nickel_out(No3), .dispense(D3));
    Item_Four  IF(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .nickel_out(No4), .dispense(D4));

    // Output values based on the selected item
    always @(*) begin
        case (item_number)
            4'b0001: begin
                nickel_out = No1;
                dispense = D1;
            end
            4'b0010: begin
                nickel_out = No2;
                dispense = D2;
            end
            4'b0100: begin
                nickel_out = No3;
                dispense = D3;
            end
            4'b1000: begin
                nickel_out = No4;
                dispense = D4;
            end
            default: begin
                nickel_out = 0;  // Default values
                dispense = 0;
            end
        endcase
    end
endmodule
