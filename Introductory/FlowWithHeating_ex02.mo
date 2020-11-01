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
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 10, height = 100 * 1000, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[pipe.nNodes] annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = liquid1, diameter = 0.01, length = 0.5, nNodes = 5, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / pipe.nNodes)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = pipe.nNodes)  annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_heat.y, gain1.u) annotation(
    Line(points = {{-69, 50}, {-62, 50}}, color = {0, 0, 127}));
  connect(gain1.y, replicator1.u) annotation(
    Line(points = {{-39, 50}, {-32, 50}}, color = {0, 0, 127}));
  connect(replicator1.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-8, 50}, {-2, 50}, {-2, 50}, {0, 50}}, color = {0, 0, 127}, thickness = 0.5));
  connect(prescribedHeatFlow1.port, pipe.heatPorts) annotation(
    Line(points = {{20, 50}, {40, 50}, {40, 14}}, color = {191, 0, 0}, thickness = 0.5));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{10, 10}, {30, 10}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{50, 10}, {70, 10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end FlowWithHeating_ex02;
