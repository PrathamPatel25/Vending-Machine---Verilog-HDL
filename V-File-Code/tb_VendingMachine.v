`timescale 1ns / 1ps

module tb_VendingMachine;

    // Testbench signals
    reg [3:0] item_number;
    reg nickel_in, dime_in, clock;
    wire nickel_out, dispense;

    // Instantiate the VendingMachine
    VendingMachine vm (
        .item_number(item_number),
        .nickel_in(nickel_in),
        .dime_in(dime_in),
        .clock(clock),
        .nickel_out(nickel_out),
        .dispense(dispense)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #1 clock = ~clock;  // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize signals
        nickel_in = 0;
        dime_in = 0;
        item_number = 4'b0000;

        // Reset the machine
        // #10 reset = 0;  // Release reset
        // #10 reset = 1;  // Assert reset again

        // Test case 1: Select Item 1 and check outputs
        item_number = 4'b0001;  // Select Item 1
        #10 nickel_in = 1;  // Insert nickel
        #10 nickel_in = 0;  // Release nickel
        #10 dime_in = 1;    // Insert dime
        #10 dime_in = 0;    // Release dime
        #10;

        // Check outputs for Item 1
        $display("Item 1: nickel_out = %b, dispense = %b", nickel_out, dispense);

        // Test case 2: Select Item 2
        item_number = 4'b0010;  // Select Item 2
        #10 nickel_in = 1;      // Insert nickel
        #10 nickel_in = 0;      // Release nickel
        #10 dime_in = 1;        // Insert dime
        #10 dime_in = 1;        // Release dime
        #10;

        // Check outputs for Item 2
        $display("Item 2: nickel_out = %b, dispense = %b", nickel_out, dispense);

        // Test case 3: Select Item 3
        item_number = 4'b0100;  // Select Item 3
        #10 nickel_in = 1;      // Insert nickel
        #10 nickel_in = 0;      // Release nickel
        #10 dime_in = 1;        // Insert dime
        #10 dime_in = 0;        // Release dime
        #10;

        // Check outputs for Item 3
        $display("Item 3: nickel_out = %b, dispense = %b", nickel_out, dispense);

        // Test case 4: Select Item 4
        item_number = 4'b1000;  // Select Item 4
        #10 nickel_in = 1;      // Insert nickel
        #10 nickel_in = 0;      // Release nickel
        #10 dime_in = 1;        // Insert dime
        #10 dime_in = 0;        // Release dime
        #10;

        // Check outputs for Item 4
        $display("Item 4: nickel_out = %b, dispense = %b", nickel_out, dispense);

        // Test case 5: No item selected
        item_number = 4'b0000;  // No item selected
        #10;
        $display("No item: nickel_out = %b, dispense = %b", nickel_out, dispense);

    end

endmodule
