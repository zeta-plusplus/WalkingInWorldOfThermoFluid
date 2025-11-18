within WalkingInWorldOfThermoFluid.Easy;

model FlowWithHeating_ex03
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //----------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, p_ambient(displayUnit = "Pa") = 101.325*1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(transformation(origin = {100, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_boundary_p(duration = 0.1, height = 300*1000, offset = 200*1000, startTime = 30) annotation(
    Placement(transformation(origin = {-70, -2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = 0.1, nPorts = 2, use_portsData = false) annotation(
    Placement(transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.01, length = 0.5) annotation(
    Placement(transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.01, flowModel(show_Res = true), length = 0.5) annotation(
    Placement(transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = 0.1, nPorts = 2, use_portsData = false, use_HeatTransfer = true) annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_convection_Gc(duration = 0.1, height = 0, offset = 500, startTime = 10) annotation(
    Placement(transformation(origin = {65, 30}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_prescT(duration = 0.1, height = 50, offset = 288.15, startTime = 70) annotation(
    Placement(transformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.01, flowModel(show_Res = true), length = 0.5) annotation(
    Placement(transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{0, -10}, {10, -10}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe1.port_a) annotation(
    Line(points = {{10, -10}, {20, -10}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume1.ports[1]) annotation(
    Line(points = {{40, -10}, {50, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-30, -10}, {-20, -10}}, color = {0, 127, 255}));
  connect(ramp_boundary_p.y, boundary.p_in) annotation(
    Line(points = {{-59, -2}, {-52, -2}}, color = {0, 0, 127}));
  connect(convection.fluid, volume1.heatPort) annotation(
    Line(points = {{40, 20}, {40, 0}}, color = {191, 0, 0}));
  connect(convection.Gc, ramp_convection_Gc.y) annotation(
    Line(points = {{50, 30}, {59.5, 30}}, color = {0, 0, 127}));
  connect(prescribedTemperature.port, convection.solid) annotation(
    Line(points = {{40, 50}, {40, 40}}, color = {191, 0, 0}));
  connect(prescribedTemperature.T, ramp_prescT.y) annotation(
    Line(points = {{40, 72}, {40, 80}, {21, 80}}, color = {0, 0, 127}));
  connect(volume1.ports[2], pipe2.port_a) annotation(
    Line(points = {{50, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(pipe2.port_b, boundary1.ports[1]) annotation(
    Line(points = {{80, -10}, {90, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {120, 100}})),
    __OpenModelica_commandLineOptions = "");
end FlowWithHeating_ex03;