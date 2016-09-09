/**********************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
descript:
author : Young
Version: VERA.0.0 : 2016/2/2 13:50:51
Version: VERA.2.0 : 2016/7/20 上午10:47:49

creaded: 2016/2/2 13:50:57
madified:
***********************************************/
`timescale 1ns/1ps
module wr1_rd2_addr_loop_A2 #(
	parameter					ADDR_BITS	=  25,
	parameter[ADDR_BITS-1:0]	DEF_VALUE_0	= 25'h0_00_00_00,
	parameter[ADDR_BITS-1:0]	DEF_VALUE_1	= 25'h0_00_00_00,
	parameter[ADDR_BITS-1:0]	DEF_VALUE_2	= 25'h0_00_00_00,
	parameter[ADDR_BITS-1:0]	DEF_VALUE_3	= 25'h0_00_00_00
)(
	input					enable				,
	input					write_clk        	,
	input					write_rst_n      	,
	input					write_vs       		,
    input                   write_enable        ,
	input 					read_0_clk        	,
	input 					read_0_rst_n    	,
	input 					read_0_vs       	,
	input 					read_1_clk        	,
	input 					read_1_rst_n    	,
	input 					read_1_vs       	,
	output[ADDR_BITS-1:0]	write_base			,
	output[ADDR_BITS-1:0]	read_0_base    		,
	output[ADDR_BITS-1:0]	read_1_base
);

wire[2:0]	write_m,read_0_m,read_1_m;

read_write_map_A2 #(
	.RDPORT			(2		)
)read_write_map_inst(
/*	input		*/	.wclk      	(write_clk        	    ),
/*	input		*/	.wrst_n    	(write_rst_n      	    ),
/*	input		*/	.wr_vs     	(write_vs       		),
/*  input       */  .wr_enable  (write_enable           ),
/*	            */
/*	input [2:0]	*/	.rclk    	({1'b0,read_1_clk,read_0_clk}    	),
/*	input [2:0]	*/	.rd_rst_n   ({1'b0,read_1_rst_n,read_0_rst_n}   ),
/*	input [2:0]	*/	.rd_vs      ({1'b0,read_1_vs,read_0_vs}      ),
/*              */
/*	output[2:0]	*/	.wr_base	(write_m				),
/*	output[2:0]	*/	.rd_base0	(read_0_m               ),
/*	output[2:0]	*/	.rd_base1   (read_1_m               ),
/*	output[2:0]	*/	.rd_base2	(                       )
);

reg [ADDR_BITS-1:0]		wr_addr;
reg	[ADDR_BITS-1:0]		rd_0_addr,rd_1_addr;

always@(write_m)
	case(write_m[1:0])
	2'b00:	wr_addr	= DEF_VALUE_0	;
	2'b01:	wr_addr	= DEF_VALUE_1	;
	2'b10:	wr_addr	= DEF_VALUE_2	;
	2'b11:	wr_addr	= DEF_VALUE_3	;
	default:wr_addr	= DEF_VALUE_0	;
	endcase

always@(read_0_m)
	case(read_0_m[1:0])
	2'b00:	rd_0_addr	= DEF_VALUE_0	;
	2'b01:	rd_0_addr	= DEF_VALUE_1	;
	2'b10:	rd_0_addr	= DEF_VALUE_2	;
	2'b11:	rd_0_addr	= DEF_VALUE_3	;
	default:rd_0_addr	= DEF_VALUE_0	;
	endcase

always@(read_1_m)
	case(read_1_m[1:0])
	2'b00:	rd_1_addr	= DEF_VALUE_0	;
	2'b01:	rd_1_addr	= DEF_VALUE_1	;
	2'b10:	rd_1_addr	= DEF_VALUE_2	;
	2'b11:	rd_1_addr	= DEF_VALUE_3	;
	default:rd_1_addr	= DEF_VALUE_0	;
	endcase


assign	write_base	= enable? wr_addr 	: DEF_VALUE_0	;
assign	read_0_base	= enable? rd_0_addr	: DEF_VALUE_0	;
assign	read_1_base	= enable? rd_1_addr	: DEF_VALUE_0	;

endmodule
