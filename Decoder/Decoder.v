module decoder #(parameter N=x)( // Change N value to number of input lines
    input [N-1:0] A,
  output [(1<<N)-1:0] Y // 2**N == 1<<N; 2**N for simulations, 1<<N for synthesizable code
);
    assign Y = 1 << A;
endmodule
