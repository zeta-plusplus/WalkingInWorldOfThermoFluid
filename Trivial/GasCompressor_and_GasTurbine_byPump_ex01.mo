within WalkingInWorldOfThermoFluid.Trivial;

model GasCompressor_and_GasTurbine_byPump_ex01
  extends Modelica.Icons.Example;
  
  //----------
  parameter Real kFlowCmp=1;
  parameter Real kHeadCmp=1;
  parameter Real arrFlowCmp[2]={kFlowCmp*0.0, kFlowCmp*45.0};
  parameter Real arrHeadCmp[2]={kHeadCmp*11000, kHeadCmp*0};
  //---
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-290, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 3, p =  101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 5, height = 0, offset = 10000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-28, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-90, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {190, 106}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0 * 101.325 * 1000, offset =  101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-60, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump CmpByPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = arrFlowCmp, head_nominal = arrHeadCmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 10000, T_start = 500, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 2 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, 106}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrSh annotation(
    Placement(visible = true, transformation(origin = {-130, 42}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-205, 106}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-129, 106}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-226, 106}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-151, 18}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-227, 82}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-109, 64}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-106, 101}, extent = {{-6, -5}, {6, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-94, 74}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-235, 125}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Wc1(y = m_flow_1.m_flow * sqrt(T1.T / 288.15) / (p1.p / (101.325 * 1000)))  annotation(
    Placement(visible = true, transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PR3q1(y = p3.p / p1.p)  annotation(
    Placement(visible = true, transformation(origin = {-220, 146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-215, 119}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-115, 117}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = Modelica.Media.Air.DryAirNasa, dp_nominal = 10 * 100 * 1000, m_flow_nominal = 45)  annotation(
    Placement(visible = true, transformation(origin = {-30, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = -0.9, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30, 150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure p5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {44, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression calc_Wc_Trb(y = 6 * (1 - exp(-(PRtrb.y - 1) / 0.11))) annotation(
    Placement(visible = true, transformation(origin = {-50, -118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {20, -57}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp rampT4(duration = 2, height = 300, offset = 800, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-5, -94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression calc_m_flow_Trb(y = calc_Wc_Trb.y * (p4.p / (101.325 * 1000)) / sqrt(T4.T / 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-30, -114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump TrbbyPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, N_nominal = -1000, V = 0.01, control_m_flow = true, m_flow_nominal = -5, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {-20, -42}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Blocks.Math.Division PRtrb annotation(
    Placement(visible = true, transformation(origin = {-60, -92}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-68, -57}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_p4(duration = 2, height = 5 * 100 * 1000, offset = 1.2 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_pT(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {66, -42}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_pT1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-88, -63}, extent = {{7, -7}, {-7, 7}}, rotation = 180)));
equation
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-279, 126}, {-270, 126}, {-270, 114}, {-262, 114}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-279, 96}, {-273, 96}, {-273, 110}, {-262, 110}}, color = {0, 0, 127}));
  connect(CmpByPump.port_b, p3.port) annotation(
    Line(points = {{-140, 106}, {-135, 106}}, color = {0, 127, 255}));
  connect(p1.port, boundary.ports[1]) annotation(
    Line(points = {{-232, 106}, {-240, 106}}, color = {0, 127, 255}));
  connect(p1.port, m_flow_1.port_a) annotation(
    Line(points = {{-232, 106}, {-210, 106}}, color = {0, 127, 255}));
  connect(m_flow_1.port_b, CmpByPump.port_a) annotation(
    Line(points = {{-200, 106}, {-180, 106}}, color = {0, 127, 255}));
  connect(CmpByPump.shaft, pwrSh.flange_b) annotation(
    Line(points = {{-160, 86}, {-160, 42}, {-140, 42}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-71, 42}, {-79, 42}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{-39, 42}, {-49, 42}}, color = {0, 0, 127}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131.45, 18}, {-122.45, 18}, {-122.45, 32}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, m_flow_1.m_flow) annotation(
    Line(points = {{-209.75, 82}, {-204.75, 82}, {-204.75, 100.5}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, p3.p) annotation(
    Line(points = {{-126.25, 64}, {-129, 64}, {-129, 99}}, color = {0, 0, 127}));
  connect(p3.port, T3.port) annotation(
    Line(points = {{-135, 106}, {-106, 106}}, color = {0, 127, 255}));
  connect(T3.T, realValue11.numberPort) annotation(
    Line(points = {{-110.2, 101}, {-117.2, 101}, {-117.2, 74}, {-112.2, 74}}, color = {0, 0, 127}));
  connect(boundary.ports[2], T1.port) annotation(
    Line(points = {{-240, 106}, {-235, 106}, {-235, 120}}, color = {0, 127, 255}));
  connect(boundary.ports[3], h1.port) annotation(
    Line(points = {{-240, 106}, {-215, 106}, {-215, 114}}, color = {0, 127, 255}));
  connect(CmpByPump.port_b, h3.port) annotation(
    Line(points = {{-140, 106}, {-115, 106}, {-115, 112}}, color = {0, 127, 255}));
  connect(pwrSh.flange_a, speed1.flange) annotation(
    Line(points = {{-120, 42}, {-100, 42}}));
  connect(CmpByPump.port_b, valveLinear.port_a) annotation(
    Line(points = {{-140, 106}, {-40, 106}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], valveLinear.port_b) annotation(
    Line(points = {{180, 106}, {-20, 106}}, color = {0, 127, 255}));
  connect(ramp.y, valveLinear.opening) annotation(
    Line(points = {{-30, 139}, {-30, 113}}, color = {0, 0, 127}));
  connect(TrbbyPump.port_a, m_flow_5.port_a) annotation(
    Line(points = {{0, -42}, {56, -42}}, color = {0, 127, 255}));
  connect(p4.p, PRtrb.u1) annotation(
    Line(points = {{-80.3, -63}, {-80.3, -80}, {-66.3, -80}}, color = {0, 0, 127}));
  connect(TrbbyPump.port_a, T5.port) annotation(
    Line(points = {{0, -42}, {20, -42}, {20, -50}}, color = {0, 127, 255}));
  connect(ramp_p4.y, boundary_pT1.p_in) annotation(
    Line(points = {{-139, -22}, {-130, -22}, {-130, -34}, {-122, -34}}, color = {0, 0, 127}));
  connect(boundary_pT.ports[1], m_flow_5.port_b) annotation(
    Line(points = {{110, -42}, {76, -42}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_b, p4.port) annotation(
    Line(points = {{-40, -42}, {-88, -42}, {-88, -56}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_b, boundary_pT1.ports[1]) annotation(
    Line(points = {{-40, -42}, {-100, -42}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_a, p5.port) annotation(
    Line(points = {{0, -42}, {44, -42}, {44, -54}}, color = {0, 127, 255}));
  connect(gain.y, TrbbyPump.m_flow_set) annotation(
    Line(points = {{-5, -87.4}, {-5, -68.4}, {-11, -68.4}, {-11, -57.4}}, color = {0, 0, 127}));
  connect(p5.p, PRtrb.u2) annotation(
    Line(points = {{37.4, -60}, {37.4, -80}, {-53.6, -80}}, color = {0, 0, 127}));
  connect(TrbbyPump.port_b, T4.port) annotation(
    Line(points = {{-40, -42}, {-68, -42}, {-68, -50}}, color = {0, 127, 255}));
  connect(rampT4.y, boundary_pT1.T_in) annotation(
    Line(points = {{-139, -52}, {-133, -52}, {-133, -38}, {-123, -38}, {-123, -38}}, color = {0, 0, 127}));
  connect(calc_m_flow_Trb.y, gain.u) annotation(
    Line(points = {{-19, -114}, {-6, -114}, {-6, -101}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {200, 200}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");

end GasCompressor_and_GasTurbine_byPump_ex01;
