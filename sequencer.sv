////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s             UVM Tutorial             s////
////s           gopi@testbenh.in           s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

class instruction_sequencer extends uvm_sequencer #(instruction);

  function new (string name, uvm_component parent);
    super.new(name, parent);
    `uvm_update_sequence_lib_and_item(instruction)
  endfunction 

  `uvm_sequencer_utils(instruction_sequencer)

endclass 

