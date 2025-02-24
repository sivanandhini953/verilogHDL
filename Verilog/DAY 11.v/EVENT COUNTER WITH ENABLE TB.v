module tb_event_counter;
    reg clk, reset, enable, event;
    wire [7:0] count;

    event_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .event(event),
        .count(count)
    );

    
    always #5 clk = ~clk;
    initial begin
     
        clk = 0;
        reset = 1;
        enable = 0;
        event = 0;
        #10 reset = 0; 

        #10 enable = 1; 

        // Generate events
        #10 event = 1; #10 event = 0; 
        #10 event = 1; #10 event = 0; 
        #20 enable = 0; 
        #10 event = 1; #10 event = 0;
        #10 enable = 1;
        #10 event = 1; #10 event = 0; 

        #10 $finish;
    end

    initial begin
      $monitor("Time: %0t , Count: %d , Enable: %b , Event: %b", 
                  $time, count, enable, event);
    end
endmodule
