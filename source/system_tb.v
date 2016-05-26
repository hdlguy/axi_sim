`timescale 1 ns / 1 ps

module system_tb();

    logic axi_aresetn, axi_error, axi_txn, txn_done;
    
    localparam clk_period = 10;
    logic   axi_aclk = 0;
    always #(clk_period/2) axi_aclk = ~axi_aclk;
  
    initial begin
        axi_aresetn = 0;
        axi_txn = 0;
        #(clk_period*10);
        axi_aresetn = 1;
         #(clk_period*10);
        axi_txn = 1;
        #(clk_period*1);
        axi_txn = 0;
     end

    system system_i(.*);
  
endmodule
