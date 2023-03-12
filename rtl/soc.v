module soc (
    input wire SWCLK,
    inout wire SWDIO,
    output wire NULL
);
wire SWCLKTCK;
     // DEBUG
    wire        SWDITMS;
    wire        TDI;
    wire        SWDO;
    wire        SWDOEN;
    wire        TDO;
    wire        nTDOEN;
    wire        DBGRESTART;
    wire        DBGRESTARTED;
    wire        EDBGRQ;
    wire        HALTED;

CORTEXM0INTEGRATION
u_cortexm0integration
(
  // CLOCK AND RESETS
  .FCLK          (FCLK),
  .SCLK          (SCLK),
  .HCLK          (HCLK),
  .DCLK          (DCLK),
  .PORESETn      (1),
  .DBGRESETn     (1),
  .HRESETn       (1),
  .SWCLKTCK      (SWCLKTCK),
  .nTRST         (1),

  // AHB-LITE MASTER PORT
  .HADDR         (cm0_haddr),
  .HBURST        (cm0_hburst),
  .HMASTLOCK     (cm0_hmastlock),
  .HPROT         (cm0_hprot),
  .HSIZE         (cm0_hsize),
  .HTRANS        (cm0_htrans),
  .HWDATA        (cm0_hwdata),
  .HWRITE        (cm0_hwrite),
  .HRDATA        (cm0_hrdata),
  .HREADY        (cm0_hready),
  .HRESP         (cm0_hresp),
  .HMASTER       (),

  // CODE SEQUENTIALITY AND SPECULATION
  .CODENSEQ      (CODENSEQ),
  .CODEHINTDE    (),
  .SPECHTRANS    (),

  // DEBUG
  .SWDITMS       (SWDITMS),
  .TDI           (TDI),
  .SWDO          (SWDO),
  .SWDOEN        (SWDOEN),
  .TDO           (TDO),
  .nTDOEN        (nTDOEN),
  .DBGRESTART    (DBGRESTART),
  .DBGRESTARTED  (DBGRESTARTED),
  .EDBGRQ        (EDBGRQ),
  .HALTED        (HALTED),

  // MISC
  .NMI            (intnmi_cm0),        // Non-maskable interrupt input
  .IRQ            (intisr_cm0),        // Interrupt request inputs
  .TXEV           (TXEV),              // Event output (SEV executed)
  .RXEV           (RXEV),              // Event input
  .LOCKUP         (LOCKUP),            // Core is locked-up
  .SYSRESETREQ    (SYSRESETREQ),       // System reset request
  .STCALIB        (STCALIB),           // SysTick calibration register value
  .STCLKEN        (1),           // SysTick SCLK clock enable
  .IRQLATENCY     (8'h00),
  .ECOREVNUM      (28'h0),

  // POWER MANAGEMENT
  .GATEHCLK      (),
  .SLEEPING      (SLEEPING),           // Core and NVIC sleeping
  .SLEEPDEEP     (SLEEPDEEP),
  .WAKEUP        (),
  .WICSENSE      (WICSENSE),
  .SLEEPHOLDREQn (1'b1),
  .SLEEPHOLDACKn (),
  .WICENREQ      (1'b0),
  .WICENACK      (),
  .CDBGPWRUPREQ  (),
  .CDBGPWRUPACK  (1'b0),

  // SCAN IO
  .SE            (1'b0),
  .RSTBYPASS     (1'b0)
);
assign NULL=0;

assign SWDITMS=SWDIO;
bufif1 u(SWDIO, SWDO, SWDOEN);

assign SWCLKTCK=SWCLK;
endmodule //soc