within WalkingInWorldOfThermoFluid.Temp;

model ControlledPump_ex01
  extends Modelica.Icons.Example;
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Machines.ControlledPump pump(redeclare package Medium = fluid1, control_m_flow = true, m_flow_nominal = 1, p_a_nominal = 100*1000, p_b_nominal = 5*100*1000, use_m_flow_set = true, use_p_set = false) annotation(
    Placement(visible = true, transformation(origin = {-39, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-86, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {82, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.01, length = 1) annotation(
    Placement(visible = true, transformation(origin = {18, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 15 + 273.15, V = 0.001, nPorts = 4, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-11, 25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-8, 75}, extent = {{10, -7}, {-10, 7}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-10, 57}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {4, 65}, extent = {{-4, 4}, {4, -4}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {46, 18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {30, 33}, extent = {{10, -7}, {-10, 7}}, rotation = 0)));
equation
  connect(boundary.ports[1], pump.port_a) annotation(
    Line(points = {{-76, 18}, {-49, 18}}, color = {0, 127, 255}));
  connect(pump.port_b, volume.ports[1]) annotation(
    Line(points = {{-29, 18}, {-11, 18}}, color = {0, 127, 255}));
  connect(pipe.port_a, volume.ports[2]) annotation(
    Line(points = {{8, 18}, {-10, 18}}, color = {0, 127, 255}));
  connect(pressure.p, gain.u) annotation(
    Line(points = {{-2.3, 57}, {3.7, 57}, {3.7, 60}}, color = {0, 0, 127}));
  connect(gain.y, realValue1.numberPort) annotation(
    Line(points = {{4, 69.4}, {4, 76}}, color = {0, 0, 127}));
  connect(pressure.port, volume.ports[3]) annotation(
    Line(points = {{-10, 50}, {-10, 18}}, color = {0, 127, 255}));
  connect(pipe.port_b, massFlowRate2.port_a) annotation(
    Line(points = {{28, 18}, {40, 18}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, boundary1.ports[1]) annotation(
    Line(points = {{52, 18}, {72, 18}}, color = {0, 127, 255}));
  connect(massFlowRate2.m_flow, pump.m_flow_set) annotation(
    Line(points = {{46, 24}, {46, 44}, {-44, 44}, {-44, 26}}, color = {0, 0, 127}));
  connect(realValue11.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{41.5, 33}, {46, 33}, {46, 24}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1));
end ControlledPump_ex01;
