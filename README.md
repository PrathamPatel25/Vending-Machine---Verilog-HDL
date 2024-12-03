# Vending Machine Project

## Features

- **Item Selection**: Allows selection from four items priced at 15, 20, 25, and 30 coins.
- **Payment Validation**: Accepts payments in 5 and 10 coin denominations only.
- **Change Calculation**: Returns change accurately using 5 and 10 coin denominations when payment exceeds the item's price.
- **Finite State Machine**: Implements modular FSMs to control item selection, payment validation, and change dispensing.
- **Simulation**: Verified for accuracy using a test bench and simulation waveforms.

## Project Structure

- **`Main Module`**: Controls the overall functionality of the vending machine.
- **`Item Modules`**: Separate modules for each of the four items to handle payment and change calculation.
- **RTL Schematic**: Includes a Register Transfer Level (RTL) schematic for better visualization of the design.
- **Test Bench**: Simulates various user interactions to validate functionality.
- **Simulation Results**: Demonstrates FSM state transitions and correctness of outputs.

## How It Works

1. **Item Selection**: Users select an item using encoded inputs.
2. **Payment**: Insert coins in denominations of 5 or 10.
3. **Validation**: The machine checks if the amount is sufficient.
4. **Dispensing**: The selected item is dispensed, and change is returned if necessary.

## Results

- Accurate transaction processing, validating payments and dispensing the correct item.
- Precise change calculation and dispensing for overpayments.

## Future Scope

- Extend payment options to additional denominations (e.g., ₹1, ₹2, ₹50).
- Expand the product range with more items.
- Optimize change dispensing for efficiency.
- Optimize our code
