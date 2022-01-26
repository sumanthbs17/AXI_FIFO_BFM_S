`ifndef AXI4_MASTER_BK_READ_16B_TRANSFER_SEQ_INCLUDED_
`define AXI4_MASTER_BK_READ_16B_TRANSFER_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: axi4_master_bk_read_16b_transfer_seq
// Extends the axi4_master_bk_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class axi4_master_bk_read_16b_transfer_seq extends axi4_master_bk_base_seq;
  `uvm_object_utils(axi4_master_bk_read_16b_transfer_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi4_master_bk_read_16b_transfer_seq");
  extern task body();
endclass : axi4_master_bk_read_16b_transfer_seq

//--------------------------------------------------------------------------------------------
// Construct: new
// Initializes new memory for the object
//
// Parameters:
//  name - axi4_master_bk_read_16b_transfer_seq
//--------------------------------------------------------------------------------------------
function axi4_master_bk_read_16b_transfer_seq::new(string name = "axi4_master_bk_read_16b_transfer_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Creates the req of type master_bk transaction and randomises the req
//--------------------------------------------------------------------------------------------
task axi4_master_bk_read_16b_transfer_seq::body();
  super.body();
  req.transfer_type=BLOCKING_READ;
//  req = axi4_master_bk_tx::type_id::create("req");
  //req.axi4_master_bk_agent_cfg_h = p_sequencer.axi4_master_bk_agent_cfg_h;
  
  start_item(req);
  if(!req.randomize() with {req.arsize == READ_2_BYTES;
                            req.tx_type == READ;
                            req.arburst == READ_INCR;
                            req.transfer_type == BLOCKING_READ;}) begin

    `uvm_fatal("axi4","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body

`endif

