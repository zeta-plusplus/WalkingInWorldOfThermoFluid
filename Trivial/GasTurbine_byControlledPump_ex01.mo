within WalkingInWorldOfThermoFluid.Trivial;

model GasTurbine_byControlledPump_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  //parameter Real arrFlowTrb[3]={0, 3, 6};
  //parameter Real arrHeadTrb[3]={0, -6000, -15000};
  //parameter Real arrFlowTrb[3]={0, -3, -4};
  //parameter Real arrHeadTrb[3]={20000, 10000, 0};
  parameter Real arrFlowTrb[3]={0, -3, -4};
  parameter Real arrHeadTrb[3]={0, 10000, 20000};
  //parameter Real arrFlowTrb[3]={0, -3, -4};
  //parameter Real arrHeadTrb[3]={0, -10000, -20000};
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 2, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {36, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {66, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_downstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {92, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset = 1.5 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_upstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-91, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Division PR annotation(
    Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Machines.ControlledPump Trb(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = -1000, V = 0.01, m_flow_nominal = -2, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T_downstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {10, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_upstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-36, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = -1, offset = -2, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{46, 30}, {56, 30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, p_downstream.port) annotation(
    Line(points = {{76, 30}, {92, 30}}, color = {0, 127, 255}));
  connect(p_downstream.port, boundary1.ports[1]) annotation(
    Line(points = {{92, 30}, {110, 30}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-139, 50}, {-130, 50}, {-130, 38}, {-122, 38}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-139, 20}, {-133, 20}, {-133, 34}, {-123, 34}, {-123, 34}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-100, 30}, {-80, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[2], p_upstream.port) annotation(
    Line(points = {{-100, 30}, {-91, 30}, {-91, 16}}, color = {0, 127, 255}));
  connect(p_upstream.p, PR.u1) annotation(
    Line(points = {{-80, 6}, {-80, -8}, {-66, -8}}, color = {0, 0, 127}));
  connect(p_downstream.p, PR.u2) annotation(
    Line(points = {{81, 20}, {81, -8}, {-54, -8}}, color = {0, 0, 127}));
  connect(volumeFlowRate2.port_b, Trb.port_b) annotation(
    Line(points = {{-60, 30}, {-20, 30}}, color = {0, 127, 255}));
  connect(Trb.port_a, volumeFlowRate1.port_a) annotation(
    Line(points = {{0, 30}, {26, 30}}, color = {0, 127, 255}));
  connect(Trb.port_a, T_downstream.port) annotation(
    Line(points = {{0, 30}, {10, 30}, {10, 22}}, color = {0, 127, 255}));
  connect(Trb.port_b, T_upstream.port) annotation(
    Line(points = {{-20, 30}, {-36, 30}, {-36, 22}}, color = {0, 127, 255}));
  connect(ramp1.y, Trb.m_flow_set) annotation(
    Line(points = {{-39, -60}, {-6, -60}, {-6, 22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -140}, {140, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end GasTurbine_byControlledPump_ex01;
