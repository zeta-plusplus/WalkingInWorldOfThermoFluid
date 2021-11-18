within WalkingInWorldOfThermoFluid.Introductory;

model FlowWithHeating_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, p_ambient(displayUnit = "Pa") = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 10, height = 100 * 1000, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, V = Modelica.Constants.pi / 4 * pipe.diameter ^ 2.0 * pipe.length,nPorts = 2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, diameter = 0.01, length = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, diameter = 0.01, flowModel(show_Res = true), length = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, V = Modelica.Constants.pi / 4 * pipe1.diameter ^ 2.0 * pipe1.length, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_heat.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-59, 50}, {-50, 50}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{-30, 50}, {-20, 50}, {-20, 20}}, color = {191, 0, 0}));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-60, 10}, {-50, 10}, {-50, 10}, {-50, 10}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-30, 10}, {-12, 10}, {-12, 10}, {-10, 10}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe1.port_a) annotation(
    Line(points = {{-10, 10}, {10, 10}, {10, 10}, {10, 10}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume1.ports[1]) annotation(
    Line(points = {{30, 10}, {46, 10}, {46, 10}, {50, 10}}, color = {0, 127, 255}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{50, 10}, {70, 10}}, color = {0, 127, 255}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {120, 100}})),
  __OpenModelica_commandLineOptions = "");
end FlowWithHeating_ex01;
