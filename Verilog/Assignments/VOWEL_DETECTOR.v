module vowel_checker(
  input [7:0] char,   // 8-bit ASCII input character
    output reg is_vowel // Output: 1 if vowel, 0 if consonant
);

always @(*) begin
  case (char)
        "A", "E", "I", "O", "U",  // Uppercase vowels
        "a", "e", "i", "o", "u":  // Lowercase vowels
            is_vowel = 1'b1; // It's a vowel
        default:
            is_vowel = 1'b0; // It's a consonant
    endcase
end

endmodule
