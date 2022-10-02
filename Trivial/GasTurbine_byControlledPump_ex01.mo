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
  parameter Real arrFlowTrb[3] = {0, -3, -4};
  parameter Real arrHeadTrb[3] = {0, 10000, 20000};
  //parameter Real arrFlowTrb[3]={0, -3, -4};
  //parameter Real arrHeadTrb[3]={0, -10000, -20000};
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 2, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {36, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {66, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_downstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 1 * 100 * 1000, offset = 1.2 * 100 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 200, offset = 800, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_upstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-91, -14}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Division PR annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Machines.ControlledPump Trb(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = -1000, V = 0.01, control_m_flow = true, m_flow_nominal = -5, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression calc_Wc_Trb(y = 6 * (1 - exp(-(PR.y - 1) / 0.11))) annotation(
    Placement(visible = true, transformation(origin = {-50, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression calc_m_flow_Trb(y = calc_Wc_Trb.y * (p_upstream.p / (101.325 * 1000)) / sqrt(T_upstream.T / 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-30, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T_downstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {14, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_upstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-36, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-5, -42}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
equation
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{46, 10}, {56, 10}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, p_downstream.port) annotation(
    Line(points = {{76, 10}, {92, 10}}, color = {0, 127, 255}));
  connect(p_downstream.port, boundary1.ports[1]) annotation(
    Line(points = {{92, 10}, {110, 10}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-139, 30}, {-130, 30}, {-130, 18}, {-122, 18}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-139, 0}, {-133, 0}, {-133, 14}, {-123, 14}, {-123, 14}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volumeFlowRate2.port_a) annotation(
    Line(points = {{-100, 10}, {-80, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[2], p_upstream.port) annotation(
    Line(points = {{-100, 10}, {-91, 10}, {-91, -4}}, color = {0, 127, 255}));
  connect(p_upstream.p, PR.u1) annotation(
    Line(points = {{-80, -14}, {-80, -28}, {-66, -28}}, color = {0, 0, 127}));
  connect(p_downstream.p, PR.u2) annotation(
    Line(points = {{81, 0}, {81, -28}, {-54, -28}}, color = {0, 0, 127}));
  connect(volumeFlowRate2.port_b, Trb.port_b) annotation(
    Line(points = {{-60, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(Trb.port_a, volumeFlowRate1.port_a) annotation(
    Line(points = {{0, 10}, {26, 10}}, color = {0, 127, 255}));
  connect(Trb.port_a, T_downstream.port) annotation(
    Line(points = {{0, 10}, {14, 10}, {14, 2}}, color = {0, 127, 255}));
  connect(Trb.port_b, T_upstream.port) annotation(
    Line(points = {{-20, 10}, {-36, 10}, {-36, 2}}, color = {0, 127, 255}));
  connect(calc_m_flow_Trb.y, gain.u) annotation(
    Line(points = {{-19, -62}, {-6, -62}, {-6, -49}}, color = {0, 0, 127}));
  connect(gain.y, Trb.m_flow_set) annotation(
    Line(points = {{-5, -35.4}, {-5, 2.6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -140}, {140, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end GasTurbine_byControlledPump_ex01;
