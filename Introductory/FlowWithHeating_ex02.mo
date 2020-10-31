within WalkingInWorldOfThermoFluid.Introductory;

model FlowWithHeating_ex02
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, p_ambient(displayUnit = "Pa") = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 10, height = 100 * 1000, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = liquid1, diameter = 0.01, length = 0.5, nNodes = 5, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(prescribedHeatFlow1.port, pipe.heatPorts[3]) annotation(
    Line(points = {{-30, 50}, {-10, 50}, {-10, 14}, {-10, 14}}, color = {191, 0, 0}));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{0, 10}, {20, 10}}, color = {0, 127, 255}));
  connect(ramp_heat.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-59, 50}, {-50, 50}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end FlowWithHeating_ex02;
