`timescale 1ns / 1ps

module tb;
    wire [31:0] Result;    
    reg [31:0] A,B;
    reg A_S;
    
    main DUT(.A_in(A),
             .A_S(A_S),
             .B_in(B),
             .Result(Result)
             );
    
    initial begin
        A = 0;
        B = 0;
        A_S = 0;
        
        #50
        A = 32'b10000001110000000000000000000000;  //4.7
        B = 32'b00000000100000000000000000000000;  //6.2
        A_S = 0;  //10.9
        
        #100
        A = 32'b01000000100101100110011001100110;  //4.7
        B = 32'b01000000110001100110011001100110;  //6.2
        A_S = 1; //-1.5
        //---------
        #100
        A = 32'b01000000100101100110011001100110;
        B = 32'b11000000110001100110011001100110;
        A_S = 0; //-1.5
        
        #100
        A = 32'b01000000100101100110011001100110;
        B = 32'b11000000110001100110011001100110;
        A_S = 1; //10.9
        //-----------//
        #100
        A = 32'b11000000100101100110011001100110;
        B = 32'b01000000110001100110011001100110;
        A_S = 0; //1.5
        
        #100
        A = 32'b11000000100101100110011001100110;
        B = 32'b01000000110001100110011001100110;
        A_S = 1; //-10.9
        //-----------
        #100
        A = 32'b11000000100101100110011001100110;
        B = 32'b11000000110001100110011001100110;
        A_S = 0; //-10.9
                
        #100
        A = 32'b11000000100101100110011001100110;
        B = 32'b11000000110001100110011001100110;
        A_S = 1; //-1.5
        
    end
endmodule