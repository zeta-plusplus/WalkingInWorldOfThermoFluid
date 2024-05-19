within WalkingInWorldOfThermoFluid.Normal;

model SteamGenerator_ex02 "Complete drum boiler model, including evaporator and supplementary components"
  extends Modelica.Icons.Example;
  //-----
  parameter Boolean use_inputs = false "use external inputs instead of test data contained internally";
  
  parameter Real TminContour=273.15;
  parameter Real TmaxContour=500+273.15;
  
  parameter Real pminContour=100*1000;
  parameter Real pmaxContour=10*100*1000;
  
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 101.325*1000), p_start = 3*101.325*1000) annotation(
    Placement(transformation(origin = {3, 14},extent = {{46, -30}, {26, -10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupply annotation(
    Placement(transformation(origin = {-27, -53}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(transformation(origin = {56, -12}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(transformation(origin = {3, -31}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(transformation(origin = {8, -4}, extent = {{10, -18}, {30, -38}}, rotation = -0)));
  Modelica.Fluid.Valves.ValveLinear VaporValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 100*1000, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {34, 8}, extent = {{50, -10}, {70, -30}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {26, 0}, extent = {{-90, 70}, {-70, 90}})));
  Modelica.Blocks.Sources.Ramp ramp_TevpOut_tgt(duration = 50, height = 100, offset = 150 + 273.15, startTime = 100) annotation(
    Placement(transformation(origin = {-119, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_pevpOut_tgt(duration = 50, height = 0, offset = 4000*1000, startTime = 200) annotation(
    Placement(transformation(origin = {16, -92}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T LiquidSupplyPump(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {-82, -32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT AtmosphericBoundary(redeclare package Medium = Modelica.Media.Water.StandardWater, nPorts = 1, p = 1*101.325*1000) annotation(
    Placement(transformation(origin = {124, -12}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1/evaporator.V_t) annotation(
    Placement(transformation(origin = {-6, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(transformation(origin = {16, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.PI ctrl_pi(T = 10, k = 300) annotation(
    Placement(transformation(origin = {-82, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-6, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {-87, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PI ctrl_pi1(T = 1, k = 1000000) annotation(
    Placement(transformation(origin = {-49, -90}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature00(redeclare package Medium = Modelica.Media.Water.StandardWater,valMin = TminContour, valMax = TmaxContour)  annotation(
    Placement(transformation(origin = {-48, -38}, extent = {{10, -4}, {-10, 4}}, rotation = -0)));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature01(redeclare package Medium = Modelica.Media.Water.StandardWater,valMin = TminContour, valMax = TmaxContour)  annotation(
    Placement(transformation(origin = {12, -4}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.PressureDispColor00 Pressure00(redeclare package Medium = Modelica.Media.Water.StandardWater, valMin = pminContour, valMax = pmaxContour) annotation(
    Placement(transformation(origin = {32, 8}, extent = {{14, -4}, {-14, 4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue00(significantDigits = 3)  annotation(
    Placement(transformation(origin = {-60, -66}, extent = {{16, -8}, {-16, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue01(significantDigits = 3)  annotation(
    Placement(transformation(origin = {65, -68}, extent = {{15, -8}, {-15, 8}})));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {43, -92}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Continuous.PI ctrl_pi2(T = 1, k = -1e-9, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 1) annotation(
    Placement(transformation(origin = {69, -92}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_valveOpen(duration = 50, height = 0, offset = 1, startTime = 300) annotation(
    Placement(transformation(origin = {74, -42}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue011(significantDigits = 8) annotation(
    Placement(transformation(origin = {39, 22}, extent = {{15, -8}, {-15, 8}})));
equation
  connect(heatSupply.port, evaporator.heatPort) annotation(
    Line(points = {{-27, -43}, {-27, -22}}, color = {191, 0, 0}));
  connect(p_evaporatorOutlet.port, massFlowVapor.port_a) annotation(
    Line(points = {{28, -22}, {28, -17}, {46, -17}, {46, -12}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, VaporValve.port_a) annotation(
    Line(points = {{66, -12}, {84, -12}}, color = {0, 127, 255}));
  connect(evaporator.port_b, massFlowVapor.port_a) annotation(
    Line(points = {{-17, -12}, {46, -12}}, color = {0, 127, 255}));
  connect(T_evaporatorOutlet.port, massFlowVapor.port_a) annotation(
    Line(points = {{3, -21}, {3, -12}, {46, -12}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, AtmosphericBoundary.ports[1]) annotation(
    Line(points = {{104, -12}, {114, -12}}, color = {0, 127, 255}));
  connect(LiquidSupplyPump.ports[1], evaporator.port_a) annotation(
    Line(points = {{-72, -32}, {-17, -32}}, color = {0, 127, 255}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-6, -18}, {-6, 10}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-6, 20.5}, {-6, 32.5}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{16, 59}, {16, 39}, {2, 39}}, color = {0, 0, 127}));
  connect(ctrl_pi.u, feedback.y) annotation(
    Line(points = {{-70, 40}, {-14, 40}}, color = {0, 0, 127}));
  connect(ctrl_pi.y, LiquidSupplyPump.m_flow_in) annotation(
    Line(points = {{-93, 40}, {-109, 40}, {-109, -24}, {-92, -24}}, color = {0, 0, 127}));
  connect(ramp_TevpOut_tgt.y, feedback1.u1) annotation(
    Line(points = {{-108, -90}, {-96, -90}}, color = {0, 0, 127}));
  connect(feedback1.y, ctrl_pi1.u) annotation(
    Line(points = {{-78, -90}, {-61, -90}}, color = {0, 0, 127}));
  connect(T_evaporatorOutlet.T, feedback1.u2) annotation(
    Line(points = {{-4, -31}, {-4, -128}, {-87, -128}, {-87, -98}}, color = {0, 0, 127}));
  connect(Temperature00.port, evaporator.port_a) annotation(
    Line(points = {{-38, -38}, {-34, -38}, {-34, -32}, {-16, -32}}, color = {0, 127, 255}));
  connect(Temperature01.port, evaporator.port_b) annotation(
    Line(points = {{2, -4}, {2, -12}, {-16, -12}}, color = {0, 127, 255}));
  connect(evaporator.port_b, Pressure00.port) annotation(
    Line(points = {{-16, -12}, {46, -12}, {46, 8}}, color = {0, 127, 255}));
  connect(ctrl_pi1.y, heatSupply.Q_flow) annotation(
    Line(points = {{-38, -90}, {-27, -90}, {-27, -63}}, color = {0, 0, 127}));
  connect(realValue00.numberPort, ctrl_pi1.y) annotation(
    Line(points = {{-42, -66}, {-34, -66}, {-34, -90}, {-38, -90}}, color = {0, 0, 127}));
  connect(p_evaporatorOutlet.p, feedback2.u2) annotation(
    Line(points = {{40, -32}, {43, -32}, {43, -84}}, color = {0, 0, 127}));
  connect(ramp_pevpOut_tgt.y, feedback2.u1) annotation(
    Line(points = {{27, -92}, {35, -92}}, color = {0, 0, 127}));
  connect(feedback2.y, ctrl_pi2.u) annotation(
    Line(points = {{52, -92}, {57, -92}}, color = {0, 0, 127}));
  connect(realValue01.numberPort, ctrl_pi2.y) annotation(
    Line(points = {{82, -68}, {82, -92}, {80, -92}}, color = {0, 0, 127}));
  connect(realValue011.numberPort, massFlowVapor.m_flow) annotation(
    Line(points = {{56, 22}, {56, 0}}, color = {0, 0, 127}));
  connect(ctrl_pi2.y, VaporValve.opening) annotation(
    Line(points = {{80, -92}, {94, -92}, {94, -20}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name"), Text(extent = {{-79, 67}, {67, 21}}, textString = "drum"), Text(extent = {{-90, -14}, {88, -64}}, textString = "boiler")}),
    experiment(StopTime = 600, StartTime = 0, Tolerance = 1e-06, Interval = 0.1),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-140, -140}, {140, 100}})));
end SteamGenerator_ex02;
