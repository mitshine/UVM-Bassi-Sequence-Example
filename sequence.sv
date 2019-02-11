////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s             UVM Tutorial             s////
////s           gopi@testbenh.in           s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

class operation_addition extends uvm_sequence #(instruction);

  instruction req;
 
  function new(string name="operation_addition");
    super.new(name);
  endfunction
  
  `uvm_sequence_utils(operation_addition, instruction_sequencer)    

  virtual task body();
      req = instruction::type_id::create("req");
      wait_for_grant();
      assert(req.randomize() with {
         inst == instruction::PUSH_A;
      });
      send_request(req);
      wait_for_item_done();
      //get_response(res); This is optional. Not using in this example.

      req = instruction::type_id::create("req");
      wait_for_grant();
      req.inst = instruction::PUSH_B;
      send_request(req);
      wait_for_item_done();
      //get_response(res); 

      req = instruction::type_id::create("req");
      wait_for_grant();
      req.inst = instruction::ADD;
      send_request(req);
      wait_for_item_done();
      //get_response(res); 

      req = instruction::type_id::create("req");
      wait_for_grant();
      req.inst = instruction::POP_C;
      send_request(req);
      wait_for_item_done();
      //get_response(res); 
  endtask
  
endclass 

