/**********************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
descript:
author : Young
Version: VERA.0.0
creaded: 2015/7/20 10:08:10
madified:
***********************************************/
`timescale 1ns/1ps
module sensor_wr_scaler_rd_baseaddr #(
	parameter	ADDR_BITS	=  25,
	parameter	DEF_VALUE	= 25'h0_00_00_00
)(
	input					enable				,
	input					sensor_clk        	,
	input					sensor_rst_n      	,
	input					sensor_vs       	,
	                        
	input 					scaler_clk        	,
	input 					scaler_rst_n    	,
	input 					scaler_vs       	,
                            
	output[ADDR_BITS-1:0]	sensor_base			,
	output[ADDR_BITS-1:0]	scaler_base    		
);

wire[1:0]	sensor_m,scaler_m;

read_write_map #(   
	.RDPORT			(1		)
)read_write_map_inst(
/*	input		*/	.wclk      	(sensor_clk  			),   
/*	input		*/	.wrst_n    	(sensor_rst_n           ),
/*	input		*/	.wr_vs     	(sensor_vs              ),
/*	            */	            
/*	input [2:0]	*/	.rclk    	({2'b00,scaler_clk}    	), 
/*	input [2:0]	*/	.rd_rst_n   ({2'b00,scaler_rst_n}   ),
/*	input [2:0]	*/	.rd_vs      ({2'b00,scaler_vs}      ),
/*              */	            
/*	output[2:0]	*/	.wr_base	(sensor_m				),
/*	output[2:0]	*/	.rd_base0	(scaler_m               ),
/*	output[2:0]	*/	.rd_base1   (                       ),
/*	output[2:0]	*/	.rd_base2	(                       )
);

assign	scaler_base	= enable? {DEF_VALUE[ADDR_BITS-1:17+2],scaler_m,	DEF_VALUE[16:0]} : DEF_VALUE;

assign	sensor_base	= enable? {DEF_VALUE[ADDR_BITS-1:17+2],sensor_m,	DEF_VALUE[16:0]} : DEF_VALUE;


endmodule





