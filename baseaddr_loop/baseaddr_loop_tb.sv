/**********************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
descript:
author : Young
Version: VERA.0.0
creaded: 2015/5/26 15:36:23
madified:
***********************************************/
`timescale 1ns/1ps
module baseaddr_loop_tb;


video_generator #(
	.DSIZE			(8		),
	.WIDTH			(7	),
	.HEIGHT			(4		),
	.PRIO			(75.0	)//75 M
)video_generator_inst0(
	.block_name		("75M"		),
	.slink          (1'b1       ),
	.nlink          (           ),
	.pclk	        (wclk       ),
	.rst_n          (wrst_n   ),
	.vsync          (wr_vs      ),
	.hsync          (           ),
	.blank          (           ),
	.de             (           ),
                    
	.rdata          (			),
	.gdata          (          	),
	.bdata          (          	)
);

logic [2:0]	rdclk,rd_rst_n,rd_vs;

video_generator #(
	.DSIZE			(8		),
	.WIDTH			(20	),
	.HEIGHT			(10		),
	.PRIO			(100.0	)//75 M
)video_generator_inst1(
	.block_name		("100M"		),
	.slink          (1'b1       ),
	.nlink          (           ),
	.pclk	        (rdclk[0]   ),
	.rst_n          (rd_rst_n[0]),
	.vsync          (rd_vs[0]   ),
	.hsync          (           ),
	.blank          (           ),
	.de             (           ),
                    
	.rdata          (			),
	.gdata          (          	),
	.bdata          (          	)
);

video_generator #(
	.DSIZE			(8		),
	.WIDTH			(20	),
	.HEIGHT			(10		),
	.PRIO			(150.0	)//75 M
)video_generator_inst2(
	.block_name		("150M"		),
	.slink          (1'b1       ),
	.nlink          (           ),
	.pclk	        (rdclk[1]   ),
	.rst_n          (rd_rst_n[1]),
	.vsync          (rd_vs[1]   ),
	.hsync          (           ),
	.blank          (           ),
	.de             (           ),
                    
	.rdata          (			),
	.gdata          (          	),
	.bdata          (          	)
);

video_generator #(
	.DSIZE			(8		),
	.WIDTH			(20	),
	.HEIGHT			(10		),
	.PRIO			(30.0	)//75 M
)video_generator_inst3(
	.block_name		("30M"		),
	.slink          (1'b1       ),
	.nlink          (           ),
	.pclk	        (rdclk[2]   ),
	.rst_n          (rd_rst_n[2]),
	.vsync          (rd_vs[2]   ),
	.hsync          (           ),
	.blank          (           ),
	.de             (           ),
                    
	.rdata          (			),
	.gdata          (          	),
	.bdata          (          	)
);

read_write_map #(   
	.RDPORT			(3)
)read_write_map_inst(
	.wclk  		(wclk         	),
	.wrst_n     (wrst_n         ),
	.wr_vs      (wr_vs          ),
	                            
	.rclk     	(rdclk          ),
	.rd_rst_n   (rd_rst_n       ),
	.rd_vs      (rd_vs          ),
                                
	.rd_base0   (               ),
	.rd_base1   (               ),
	.rd_base2	(               )
);


endmodule


