within WalkingInWorldOfThermoFluid.Trivial;

model GasTurbineEngine_1sp_ByCtrldPump_ex01
  extends Modelica.Icons.Example;
  //----------
  parameter Real kFlowCmp = 1;
  parameter Real kHeadCmp = 1;
  parameter Real arrFlowCmp[2] = {kFlowCmp * 0.0, kFlowCmp * 35.0};
  parameter Real arrHeadCmp[2] = {kHeadCmp * 12000, kHeadCmp * 0};
  //---
  parameter Real kFlowTrb = 5.5;
  parameter Real kFlowChokeTrb = 0.11;
  //----------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-272, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 4, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 5, height = 0, offset = 10000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {222, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {158, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0 * 101.325 * 1000, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-290, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-290, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {190, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump CmpByPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = arrFlowCmp, head_nominal = arrHeadCmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 10000, T_start = 500, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 2 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, 76}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrCmp annotation(
    Placement(visible = true, transformation(origin = {-128, -74}, extent = {{-6, 6}, {6, -6}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-205, 76}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-123, 76}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-227, 68}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-151, -92}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-227, 52}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-101, 34}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-98, 71}, extent = {{-6, -5}, {6, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-86, 44}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-235, 95}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Wc1(y = m_flow_1.m_flow * sqrt(T1.T / 288.15) / (p1.p / (101.325 * 1000))) annotation(
    Placement(visible = true, transformation(origin = {-220, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PR3q1(y = p3.p / p1.p) annotation(
    Placement(visible = true, transformation(origin = {-220, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-215, 89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-107, 87}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {108, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression calc_Wc_Trb(y = kFlowTrb * (1 - exp(-(PRtrb.y - 1) / kFlowChokeTrb))) annotation(
    Placement(visible = true, transformation(origin = {46, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {132, 61}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
    Placement(visible = true, transformation(origin = {86, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression calc_m_flow_Trb(y = calc_Wc_Trb.y * (p4.p / (101.325 * 1000)) / sqrt(T4.T / 288.15)) annotation(
    Placement(visible = true, transformation(origin = {66, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump TrbByPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, N_nominal = -1000, V = 0.01, control_m_flow = true, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_nominal = -5, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {76, 76}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Blocks.Math.Division PRtrb annotation(
    Placement(visible = true, transformation(origin = {59, 39}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {16, 61}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary_pT(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {188, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {147, 76}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {41, 60}, extent = {{4, -4}, {-4, 4}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Brn(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 0.01, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-46, 56}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-76, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TbrnOut_tgt(duration = 5, height = 1000, offset = 500, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-183, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-76, 174}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-153, 148}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI ctrlHeatPI(T = 0.01, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1000, x_start = 1000) annotation(
    Placement(visible = true, transformation(origin = {-121, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor w_Trb annotation(
    Placement(visible = true, transformation(origin = {54, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrTrb annotation(
    Placement(visible = true, transformation(origin = {74, -57}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression calc_Trb_trq(y = -TrbByPump.W_total / w_Trb.w) annotation(
    Placement(visible = true, transformation(origin = {48, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_Trb annotation(
    Placement(visible = true, transformation(origin = {74, -21}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerGen annotation(
    Placement(visible = true, transformation(origin = {98, -74}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {117, -94}, extent = {{-17, -10}, {17, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatAddedIntoEng annotation(
    Placement(visible = true, transformation(origin = {-66, 90}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression PR4q5(y = p4.p / p5.p) annotation(
    Placement(visible = true, transformation(origin = {-4, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Wc4(y = TrbByPump.port_b.m_flow * sqrt(T4.T / 288.15) / (p4.p / (101.325 * 1000))) annotation(
    Placement(visible = true, transformation(origin = {0, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division calc_effThermal annotation(
    Placement(visible = true, transformation(origin = {112, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain calcWfuel(k = 1 / (43 * 10 ^ 6)) annotation(
    Placement(visible = true, transformation(origin = {-21, 120}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division calcFAR annotation(
    Placement(visible = true, transformation(origin = {1, 116}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-279, 96}, {-270, 96}, {-270, 84}, {-262, 84}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-279, 66}, {-273, 66}, {-273, 80}, {-262, 80}}, color = {0, 0, 127}));
  connect(CmpByPump.port_b, p3.port) annotation(
    Line(points = {{-140, 76}, {-129, 76}}, color = {0, 127, 255}));
  connect(m_flow_1.port_b, CmpByPump.port_a) annotation(
    Line(points = {{-200, 76}, {-180, 76}}, color = {0, 127, 255}, thickness = 1));
  connect(CmpByPump.shaft, pwrCmp.flange_b) annotation(
    Line(points = {{-160, 56}, {-160, -74}, {-134, -74}}, thickness = 1.5));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{179, -74}, {170, -74}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{211, -74}, {201, -74}}, color = {0, 0, 127}));
  connect(realValue.numberPort, pwrCmp.power) annotation(
    Line(points = {{-131.45, -92}, {-123, -92}, {-123, -81}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, m_flow_1.m_flow) annotation(
    Line(points = {{-209.75, 52}, {-205, 52}, {-205, 70.5}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, p3.p) annotation(
    Line(points = {{-118.25, 34}, {-123, 34}, {-123, 69}}, color = {0, 0, 127}));
  connect(p3.port, T3.port) annotation(
    Line(points = {{-129, 76}, {-98, 76}}, color = {0, 127, 255}));
  connect(T3.T, realValue11.numberPort) annotation(
    Line(points = {{-102.2, 71}, {-109.2, 71}, {-109.2, 44}, {-104.2, 44}}, color = {0, 0, 127}));
  connect(boundary.ports[1], T1.port) annotation(
    Line(points = {{-240, 76}, {-235, 76}, {-235, 90}}, color = {0, 127, 255}));
  connect(boundary.ports[2], h1.port) annotation(
    Line(points = {{-240, 76}, {-215, 76}, {-215, 84}}, color = {0, 127, 255}));
  connect(CmpByPump.port_b, h3.port) annotation(
    Line(points = {{-140, 76}, {-107, 76}, {-107, 82}}, color = {0, 127, 255}));
  connect(TrbByPump.port_a, m_flow_5.port_a) annotation(
    Line(points = {{96, 76}, {142, 76}}, color = {0, 127, 255}, thickness = 1));
  connect(p4.p, PRtrb.u1) annotation(
    Line(points = {{45, 60}, {45, 45}, {56, 45}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(TrbByPump.port_a, T5.port) annotation(
    Line(points = {{96, 76}, {132, 76}, {132, 68}}, color = {0, 127, 255}));
  connect(boundary_pT.ports[1], m_flow_5.port_b) annotation(
    Line(points = {{178, 76}, {152, 76}}, color = {0, 127, 255}, thickness = 1));
  connect(TrbByPump.port_b, p4.port) annotation(
    Line(points = {{56, 76}, {41, 76}, {41, 64}}, color = {0, 127, 255}));
  connect(TrbByPump.port_a, p5.port) annotation(
    Line(points = {{96, 76}, {108, 76}, {108, 64}}, color = {0, 127, 255}));
  connect(gain.y, TrbByPump.m_flow_set) annotation(
    Line(points = {{86, 41}, {86, 59.6}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(p5.p, PRtrb.u2) annotation(
    Line(points = {{104, 60}, {104, 45}, {62, 45}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(TrbByPump.port_b, T4.port) annotation(
    Line(points = {{56, 76}, {16, 76}, {16, 68}}, color = {0, 127, 255}));
  connect(calc_m_flow_Trb.y, gain.u) annotation(
    Line(points = {{77, 18}, {86, 18}, {86, 27}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Brn.ports[1], CmpByPump.port_b) annotation(
    Line(points = {{-46, 76}, {-140, 76}}, color = {0, 127, 255}, thickness = 1));
  connect(Brn.ports[2], TrbByPump.port_b) annotation(
    Line(points = {{-46, 76}, {56, 76}}, color = {0, 127, 255}, thickness = 1));
  connect(ramp_TbrnOut_tgt.y, feedback.u1) annotation(
    Line(points = {{-172, 148}, {-161, 148}}, color = {0, 0, 127}));
  connect(ctrlHeatPI.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-110, 148}, {-86, 148}}, color = {0, 0, 127}));
  connect(feedback.y, ctrlHeatPI.u) annotation(
    Line(points = {{-144, 148}, {-133, 148}}, color = {0, 0, 127}));
  connect(temperatureSensor.T, feedback.u2) annotation(
    Line(points = {{-86, 174}, {-153, 174}, {-153, 156}}, color = {0, 0, 127}));
  connect(calc_Trb_trq.y, torque_Trb.tau) annotation(
    Line(points = {{59, -6}, {73, -6}, {73, -12}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(torque_Trb.flange, w_Trb.flange) annotation(
    Line(points = {{74, -28}, {74, -30}, {60, -30}}));
  connect(pwrCmp.flange_a, powerGen.flange_a) annotation(
    Line(points = {{-122, -74}, {88, -74}}, thickness = 1.5));
  connect(powerGen.flange_b, speed1.flange) annotation(
    Line(points = {{108, -74}, {148, -74}}, thickness = 1.5));
  connect(temperatureSensor.port, Brn.heatPort) annotation(
    Line(points = {{-66, 174}, {-66, 56}}, color = {191, 0, 0}, thickness = 1));
  connect(realValue1.numberPort, powerGen.power) annotation(
    Line(points = {{97, -94}, {90, -94}, {90, -85}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow.port, heatAddedIntoEng.port_a) annotation(
    Line(points = {{-66, 148}, {-66, 96}}, color = {191, 0, 0}, thickness = 1));
  connect(heatAddedIntoEng.port_b, Brn.heatPort) annotation(
    Line(points = {{-66, 84}, {-66, 56}}, color = {191, 0, 0}, thickness = 1));
  connect(torque_Trb.flange, pwrTrb.flange_a) annotation(
    Line(points = {{74, -28}, {74, -52}}, thickness = 1.5));
  connect(pwrTrb.flange_b, powerGen.flange_a) annotation(
    Line(points = {{74, -62}, {74, -74}, {88, -74}}, thickness = 1.5));
  connect(calc_effThermal.u1, powerGen.power) annotation(
    Line(points = {{105, -106}, {90, -106}, {90, -84}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(calc_effThermal.u2, heatAddedIntoEng.Q_flow) annotation(
    Line(points = {{105, -114}, {-22, -114}, {-22, 90}, {-60, 90}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(calcWfuel.y, calcFAR.u1) annotation(
    Line(points = {{-15.5, 120}, {-7, 120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ctrlHeatPI.y, calcWfuel.u) annotation(
    Line(points = {{-110, 148}, {-104, 148}, {-104, 120}, {-27, 120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_1.m_flow, calcFAR.u2) annotation(
    Line(points = {{-205, 70.5}, {-194, 70.5}, {-194, 112}, {-7, 112}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(boundary.ports[3], m_flow_1.port_a) annotation(
    Line(points = {{-240, 76}, {-210, 76}}, color = {0, 127, 255}, thickness = 1));
  connect(boundary.ports[4], p1.port) annotation(
    Line(points = {{-240, 76}, {-232, 76}, {-232, 68}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -120}, {240, 220}}, initialScale = 0.1), graphics = {Rectangle(origin = {73, 34}, extent = {{-47, 78}, {47, -78}}), Text(origin = {71, 124}, extent = {{-33, 6}, {33, -6}}, textString = "Turbine"), Rectangle(origin = {189, -74}, extent = {{-49, 22}, {49, -22}}), Text(origin = {167, -32}, extent = {{-27, 6}, {27, -6}}, textString = "generator"), Text(origin = {203, -44}, extent = {{-27, 6}, {27, -6}}, textString = "Speed governed"), Rectangle(origin = {-126, 157}, extent = {{-76, 29}, {76, -29}}), Text(origin = {-163, 208}, extent = {{-39, 6}, {39, -6}}, textString = "Heat flow control"), Text(origin = {-122, 196}, extent = {{-70, 4}, {70, -4}}, textString = "target: gas temperature at outlet of burner")}),
    __OpenModelica_commandLineOptions = "");
end GasTurbineEngine_1sp_ByCtrldPump_ex01;
