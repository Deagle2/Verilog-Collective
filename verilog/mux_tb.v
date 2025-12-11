timescale 1ns/1ps
module mux_tb;
    parameter N = <<N>>;
    parameter K = <<K>>;
    reg  [(1<<N)*K-1:0] D;
    reg  [N-1:0] S;
    wire [K-1:0] Y;
    integer i;

    generic_mux #(.N(N), .K(K)) DUT (.D(D), .S(S), .Y(Y));

    initial begin
        $dumpfile("mux_dump.vcd");
        $dumpvars(0, mux_tb);
        // initialize each input block to its index (replicated/truncated to K bits)
        for (i = 0; i < (1<<N); i = i + 1) begin
            D[i*K +: K] = i;
        end

        $display("--- MUX Test (N=<<N>>, K=<<K>>) ---");
        for (i = 0; i < (1<<N); i = i + 1) begin
            S = i;
            #10;
            $display("S=%0d, Y=%b", S, Y);
        end
        $display("--- Test Finished ---");
        $finish;
    end
endmodule
