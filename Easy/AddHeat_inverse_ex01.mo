within WalkingInWorldOfThermoFluid.Easy;

model AddHeat_inverse_ex01
  extends Modelica.Icons.Example;
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 1.0e-3, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-54, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 1.0e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_temperature_tgt(duration = 10, height = 100, offset = 800, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {54, 84}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, p_ambient(displayUnit = "Pa") = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(origin = {-84, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-4, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {37, 43}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(visible = true, transformation(origin = {2, 84}, extent = {{24, -12}, {-24, 12}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-3, 25}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Modelica.Media.Air.DryAirNasa, diameter = 0.05, length = 5) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(volume1.ports[1], boundary1.ports[1]) annotation(
    Line(points = {{20, 10}, {60, 10}}, color = {0, 127, 255}, thickness = 1));
  connect(volume.ports[1], boundary.ports[1]) annotation(
    Line(points = {{-54, 10}, {-74, 10}}, color = {0, 127, 255}, thickness = 1));
  connect(volume1.ports[2], temperature.port) annotation(
    Line(points = {{20, 10}, {37, 10}, {37, 36}}, color = {0, 127, 255}));
  connect(ramp_temperature_tgt.y, inverseBlockConstraints.u1) annotation(
    Line(points = {{43, 84}, {28, 84}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow.port, volume1.heatPort) annotation(
    Line(points = {{6, 50}, {6, 20}, {10, 20}}, color = {191, 0, 0}));
  connect(temperatureSensor.port, volume1.heatPort) annotation(
    Line(points = {{-3, 20}, {10, 20}}, color = {191, 0, 0}));
  connect(temperatureSensor.T, inverseBlockConstraints.u2) annotation(
    Line(points = {{-3, 30}, {-3, 84}, {21, 84}}, color = {0, 0, 127}));
  connect(pipe.port_b, volume1.ports[3]) annotation(
    Line(points = {{-10, 10}, {20, 10}}, color = {0, 127, 255}, thickness = 1));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-54, 10}, {-30, 10}}, color = {0, 127, 255}, thickness = 1));
  connect(inverseBlockConstraints.y1, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-24, 84}, {-26, 84}, {-26, 50}, {-14, 50}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06));
end AddHeat_inverse_ex01;
