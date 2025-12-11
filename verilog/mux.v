module generic_mux #(parameter N = <<N>>, parameter K = <<K>>) (
    input  wire [(1<<N)*K-1:0] D, // flattened: 2^N inputs, each K bits
    input  wire [N-1:0]        S,
    output wire [K-1:0]        Y
);
    // Slice K bits starting at S*K
    assign Y = D[S*K +: K];
endmodule
