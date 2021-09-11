// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=64
  )
  (
  input clk,rst_n,en,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );


 reg [BITS-1:0] f [DEPTH-1:0];
  reg [2:0] ind;

  assign q = f[ind];

  // your RTL code here
   always @(posedge clk) 
     begin
	if (!rst_n)
	  begin
		ind <= 0;
	    for (integer i = 0; i < DEPTH; i++) begin
		f[i] <= 0;
	    end
	  end
	else
	  begin
	    if (en)
	      begin
		f[ind] = d;
		ind = ind + 1;
	      end
	  end
     end
endmodule // fifo
