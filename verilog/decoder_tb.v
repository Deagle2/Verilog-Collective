`timescale 1ns/1ps

module decoder_tb;
    parameter N = 2;                   
    reg  [N-1:0] A;                        
    wire [(1<<N)-1:0] Y;                 
   
    decoder #(.N(N)) DUT (
        .A(A),
        .Y(Y)
    );

    integer i;

    initial begin
      //$dumpfile("dump.vcd");             
      // $dumpvars(0, decoder_tb);
      for (i = 0; i < (1<<N); i++) begin
            A = i;                         
            #10;                          
            $display("A = %b, Y = %b", A, Y);
        end
        $finish;
    end
    
endmodule
