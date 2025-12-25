module tb_register_file;

    reg clk;
    reg reg_write;
    reg [2:0] write_reg, read_reg1, read_reg2;
    reg [7:0] write_data;
    wire [7:0] read_data1, read_data2;

    register_file uut (
        .clk(clk),
        .reg_write(reg_write),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reg_write = 0;

        // Write 0xFA to R6
        write_reg  = 3'b110;
        write_data = 8'b11111010;
        reg_write  = 1;

        #10; // clock edge

        reg_write = 0;

        // Read R6
        read_reg1 = 3'b110;
        read_reg2 = 3'b110;

        #10;
        $stop;
    end

endmodule
