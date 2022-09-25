within WalkingInWorldOfThermoFluid.Temp;

model GasTurbineEngine_byControlledPump_1spool_ex02
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  parameter Real kFlowCmp = 5;
  parameter Real kHeadCmp = 1;
  parameter Real arrFlowCmp[3] = {kFlowCmp * 0.2, kFlowCmp * 0.4, kFlowCmp * 0.8};
  parameter Real arrHeadCmp[3] = {kHeadCmp * 40000, kHeadCmp * 10000, kHeadCmp * 0};
  //---
  parameter Real arrFlowTrb[3] = {0, -0.2, -0.4};
  parameter Real arrHeadTrb[3] = {-20000, -10000, -0};
  //parameter Real arrFlowTrb[3]={0, (-0.2), (-0.4)};
  //parameter Real arrHeadTrb[3]={(0), (10000), 20000};
  //parameter Real arrFlowTrb[3]={0, (0.15), (0.3)};
  //parameter Real arrHeadTrb[3]={(20000), (10000), (0)};
  //---
  //----------
  //{kFlowTrb*0, kFlowTrb*(-0.25), kFlowTrb*(-0.50)}
  //{kHeadTrb*(-20000), kHeadTrb*(-15000), kHeadTrb*0}
  //{kFlowCmp*0, kFlowCmp*0.25, kFlowCmp*0.50}
  //{kHeadCmp*20000, kHeadCmp*15000, kHeadCmp*0}
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-290, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 3, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 5, height = 0, offset = 10000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {190, -140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {128, -140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {82, -12}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 2, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {190, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset = 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {158, -140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump Cmp(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = arrFlowCmp, head_nominal = arrHeadCmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 10000, T_start = 500, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, -30}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrSh annotation(
    Placement(visible = true, transformation(origin = {-130, -140}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-205, -30}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-129, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-226, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrGen annotation(
    Placement(visible = true, transformation(origin = {98, -140}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Comb(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T_start = 500, V = 0.01, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, nPorts = 4, p_start = 3 * 100 * 1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-53, -15}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-78, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 5, height = 50, offset = 700, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-28, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-90, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-151, -164}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {116, -166}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-227, -54}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-109, -72}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {110, -61}, extent = {{14, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-106, -35}, extent = {{-6, -5}, {6, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-94, -62}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-1, -38}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue111(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-9, -51}, extent = {{-15, -9}, {15, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {170, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue13(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {185, -54}, extent = {{-15, -9}, {15, 9}}, rotation = 0)));
  Modelica.Blocks.Math.Gain calcWfuel(k = 1 / (43 * 10 ^ 6)) annotation(
    Placement(visible = true, transformation(origin = {-95, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division calcFAR annotation(
    Placement(visible = true, transformation(origin = {-60, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-235, -11}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Wc1(y = m_flow_1.m_flow * sqrt(T1.T / 288.15) / (p1.p / (101.325 * 1000))) annotation(
    Placement(visible = true, transformation(origin = {-220, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Wc4(y = Trb.port_b.m_flow * sqrt(T1.T / 288.15) / (p4.p / (101.325 * 1000))) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {25, -11}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PR3q1(y = p3.p / p1.p) annotation(
    Placement(visible = true, transformation(origin = {-220, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PR4q5(y = p4.p / p5.p) annotation(
    Placement(visible = true, transformation(origin = {-20, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-215, -17}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-115, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-5, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {135, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
    Placement(visible = true, transformation(origin = {64, 6}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression calc_Wc_Trb(y = 1 / 2 * 5 * (1 - exp(-(PR_Trb.y - 1) / 0.11))) annotation(
    Placement(visible = true, transformation(origin = {23, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression calc_m_flow_Trb(y = calc_Wc_Trb.y * (p4.p / (101.325 * 1000)) / sqrt(T4.T / 288.15)) annotation(
    Placement(visible = true, transformation(origin = {47, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division PR_Trb annotation(
    Placement(visible = true, transformation(origin = {34, 5}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Fluid.Machines.ControlledPump Trb(redeclare package Medium = Modelica.Media.Air.DryAirNasa, N_nominal = -1000, V = 0.01, control_m_flow = true, m_flow_nominal = -1 / 2 * 5, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {54, -30}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression calc_Trb_trq(y = -Trb.W_total / w_Trb.w) annotation(
    Placement(visible = true, transformation(origin = {24, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_Trb annotation(
    Placement(visible = true, transformation(origin = {54, -75}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor w_Trb annotation(
    Placement(visible = true, transformation(origin = {30, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrTrb annotation(
    Placement(visible = true, transformation(origin = {54, -113}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-68, 14}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Math.Division effThermal annotation(
    Placement(visible = true, transformation(origin = {107, -187}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T_start = 500, V = 0.01, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, nPorts = 2, p_start = 3 * 100 * 1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-87, -21}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-279, -10}, {-270, -10}, {-270, -22}, {-262, -22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-279, -40}, {-273, -40}, {-273, -26}, {-262, -26}}, color = {0, 0, 127}));
  connect(Cmp.port_b, p3.port) annotation(
    Line(points = {{-140, -30}, {-135, -30}}, color = {0, 127, 255}));
  connect(p1.port, boundary.ports[1]) annotation(
    Line(points = {{-232, -30}, {-240, -30}}, color = {0, 127, 255}));
  connect(p1.port, m_flow_1.port_a) annotation(
    Line(points = {{-232, -30}, {-210, -30}}, color = {0, 127, 255}));
  connect(m_flow_1.port_b, Cmp.port_a) annotation(
    Line(points = {{-200, -30}, {-180, -30}}, color = {0, 127, 255}));
  connect(Cmp.shaft, pwrSh.flange_b) annotation(
    Line(points = {{-160, -50}, {-160, -140}, {-140, -140}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{147, -140}, {139, -140}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{179, -140}, {169, -140}}, color = {0, 0, 127}));
  connect(pwrGen.flange_b, speed1.flange) annotation(
    Line(points = {{108, -140}, {118, -140}}));
  connect(pwrSh.flange_a, inertia.flange_a) annotation(
    Line(points = {{-120, -140}, {-100, -140}}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131.45, -164}, {-122.45, -164}, {-122.45, -150}}, color = {0, 0, 127}));
  connect(pwrGen.power, realValue1.numberPort) annotation(
    Line(points = {{90, -151}, {90, -166}, {98, -166}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, m_flow_1.m_flow) annotation(
    Line(points = {{-210, -54}, {-205, -54}, {-205, -35.5}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, p3.p) annotation(
    Line(points = {{-126.25, -72}, {-129, -72}, {-129, -37}}, color = {0, 0, 127}));
  connect(p3.port, T3.port) annotation(
    Line(points = {{-135, -30}, {-106, -30}}, color = {0, 127, 255}));
  connect(T3.T, realValue11.numberPort) annotation(
    Line(points = {{-110.2, -35}, {-117.2, -35}, {-117.2, -62}, {-112.2, -62}}, color = {0, 0, 127}));
  connect(T4.T, realValue111.numberPort) annotation(
    Line(points = {{-4.5, -38}, {-26, -38}, {-26, -51}}, color = {0, 0, 127}));
  connect(p5.p, realValue4.numberPort) annotation(
    Line(points = {{87.5, -12}, {126, -12}, {126, -61}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], T5.port) annotation(
    Line(points = {{180, -30}, {170, -30}}, color = {0, 127, 255}));
  connect(T5.T, realValue13.numberPort) annotation(
    Line(points = {{166.5, -35}, {162, -35}, {162, -54}, {168, -54}}, color = {0, 0, 127}));
  connect(calcWfuel.y, calcFAR.u1) annotation(
    Line(points = {{-89.5, 60}, {-71.5, 60}}, color = {0, 0, 127}));
  connect(m_flow_1.m_flow, calcFAR.u2) annotation(
    Line(points = {{-205, -35.5}, {-205, -42}, {-198, -42}, {-198, 48}, {-72, 48}}, color = {0, 0, 127}));
  connect(boundary.ports[2], T1.port) annotation(
    Line(points = {{-240, -30}, {-235, -30}, {-235, -16}}, color = {0, 127, 255}));
  connect(Comb.ports[1], p4.port) annotation(
    Line(points = {{-53, -30}, {25, -30}, {25, -16}}, color = {0, 127, 255}));
  connect(boundary.ports[3], h1.port) annotation(
    Line(points = {{-240, -30}, {-215, -30}, {-215, -22}}, color = {0, 127, 255}));
  connect(Cmp.port_b, h3.port) annotation(
    Line(points = {{-140, -30}, {-115, -30}, {-115, -24}}, color = {0, 127, 255}));
  connect(calc_m_flow_Trb.y, gain.u) annotation(
    Line(points = {{58, 20}, {64, 20}, {64, 11}}, color = {0, 0, 127}));
  connect(inertia.flange_b, pwrGen.flange_a) annotation(
    Line(points = {{-80, -140}, {88, -140}}));
  connect(p4.p, PR_Trb.u1) annotation(
    Line(points = {{30.5, -11}, {32, -11}, {32, 0}}, color = {0, 0, 127}));
  connect(p5.p, PR_Trb.u2) annotation(
    Line(points = {{87.5, -12}, {87.5, -4}, {36, -4}, {36, 0}}, color = {0, 0, 127}));
  connect(Comb.ports[2], Trb.port_b) annotation(
    Line(points = {{-53, -30}, {34, -30}}, color = {0, 127, 255}));
  connect(gain.y, Trb.m_flow_set) annotation(
    Line(points = {{64, 2}, {64, -14}}, color = {0, 0, 127}));
  connect(Trb.port_a, boundary1.ports[2]) annotation(
    Line(points = {{74, -30}, {180, -30}}, color = {0, 127, 255}));
  connect(w_Trb.flange, torque_Trb.flange) annotation(
    Line(points = {{36, -84}, {54, -84}, {54, -82}}));
  connect(calc_Trb_trq.y, torque_Trb.tau) annotation(
    Line(points = {{35, -62}, {54, -62}, {54, -67}}, color = {0, 0, 127}));
  connect(torque_Trb.flange, pwrTrb.flange_b) annotation(
    Line(points = {{54, -82}, {54, -108}}));
  connect(inertia.flange_b, pwrTrb.flange_a) annotation(
    Line(points = {{-80, -140}, {54, -140}, {54, -118}}));
  connect(Trb.port_a, h5.port) annotation(
    Line(points = {{74, -30}, {135, -30}, {135, -24}}, color = {0, 127, 255}));
  connect(Trb.port_a, p5.port) annotation(
    Line(points = {{74, -30}, {82, -30}, {82, -17}}, color = {0, 127, 255}));
  connect(Trb.port_b, h4.port) annotation(
    Line(points = {{34, -30}, {-5, -30}, {-5, -24}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow.port, heatFlowSensor.port_a) annotation(
    Line(points = {{-68, 30}, {-68, 20}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_b, Comb.heatPort) annotation(
    Line(points = {{-68, 8}, {-68, -15}}, color = {191, 0, 0}));
  connect(heatFlowSensor.Q_flow, effThermal.u2) annotation(
    Line(points = {{-62, 14}, {-36, 14}, {-36, -191}, {99, -191}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(pwrGen.power, effThermal.u1) annotation(
    Line(points = {{90, -150}, {90, -183}, {99, -183}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(volume.ports[1], Cmp.port_b) annotation(
    Line(points = {{-87, -30}, {-140, -30}}, color = {0, 127, 255}));
  connect(Comb.ports[3], volume.ports[2]) annotation(
    Line(points = {{-53, -30}, {-87, -30}}, color = {0, 127, 255}));
  connect(T4.port, Comb.ports[4]) annotation(
    Line(points = {{-1, -33}, {-1, -30}, {-52, -30}}, color = {0, 127, 255}));
  connect(inverseBlockConstraints.y1, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-80.5, 90}, {-114, 90}, {-114, 30}, {-88, 30}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y1, calcWfuel.u) annotation(
    Line(points = {{-80.5, 90}, {-110, 90}, {-110, 60}, {-100, 60}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u1, ramp_TIT.y) annotation(
    Line(points = {{-58, 90}, {-38, 90}}, color = {0, 0, 127}));
  connect(T4.T, inverseBlockConstraints.u2) annotation(
    Line(points = {{-4, -38}, {-22, -38}, {-22, 72}, {-68, 72}, {-68, 90}, {-62, 90}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {200, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {51, -31}, extent = {{-43, 63}, {43, -63}}), Text(origin = {46, 44}, extent = {{-24, 4}, {24, -4}}, textString = "Turbine")}),
    __OpenModelica_commandLineOptions = "");
end GasTurbineEngine_byControlledPump_1spool_ex02;
