within WalkingInWorldOfThermoFluid.Trivial;

model GasCompressor_and_GasTurbine_byPump_connected_ex01
  extends Modelica.Icons.Example;
  
  //----------
  parameter Real kFlowCmp=1;
  parameter Real kHeadCmp=1;
  parameter Real arrFlowCmp[2]={kFlowCmp*0.0, kFlowCmp*35.0};
  parameter Real arrHeadCmp[2]={kHeadCmp*12000, kHeadCmp*0};
  //---
  //----------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyState)  annotation(
    Placement(visible = true, transformation(origin = {-272, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 3, p =  101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 5, height = 0, offset = 10000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {48, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-14, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0 * 101.325 * 1000, offset =  101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-290, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-290, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {16, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump CmpByPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = arrFlowCmp, head_nominal = arrHeadCmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 10000, T_start = 500, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 2 * system.p_start) annotation(
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
    Placement(visible = true, transformation(origin = {-151, 24}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
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
  Modelica.Fluid.Sensors.Pressure p5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {140, -42}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression calc_Wc_Trb(y = 5.5 * (1 - exp(-(PRtrb.y - 1) / 0.11))) annotation(
    Placement(visible = true, transformation(origin = {46, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {116, -39}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
    Placement(visible = true, transformation(origin = {86, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression calc_m_flow_Trb(y = calc_Wc_Trb.y * (p4.p / (101.325 * 1000)) / sqrt(T4.T / 288.15)) annotation(
    Placement(visible = true, transformation(origin = {66, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump TrbByPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, N_nominal = -1000, V = 0.01, control_m_flow = true, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_nominal = -5, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {76, -24}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Blocks.Math.Division PRtrb annotation(
    Placement(visible = true, transformation(origin = {36, -74}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {28, -39}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary_pT(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {188, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {157, -24}, extent = {{-7, 7}, {7, -7}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {8, -45}, extent = {{7, -7}, {-7, 7}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Brn(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 0.01, use_HeatTransfer = true, use_portsData = false, nPorts=2)  annotation(
    Placement(visible = true, transformation(origin = {-56, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-98, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 5, height = 200, offset =  1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-208, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-84, 2}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-176, -26}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI ctrlHeatPI(T = 0.01, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1000, x_start = 1000)  annotation(
    Placement(visible = true, transformation(origin = {-138, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Line(points = {{5, 42}, {-3, 42}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{37, 42}, {27, 42}}, color = {0, 0, 127}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131, 24}, {-122.45, 24}, {-122.45, 32}}, color = {0, 0, 127}));
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
    Line(points = {{-120, 42}, {-24, 42}}));
  connect(TrbByPump.port_a, m_flow_5.port_a) annotation(
    Line(points = {{96, -24}, {150, -24}}, color = {0, 127, 255}));
  connect(p4.p, PRtrb.u1) annotation(
    Line(points = {{15.7, -45}, {15.7, -62}, {29.7, -62}}, color = {0, 0, 127}));
  connect(TrbByPump.port_a, T5.port) annotation(
    Line(points = {{96, -24}, {116, -24}, {116, -32}}, color = {0, 127, 255}));
  connect(boundary_pT.ports[1], m_flow_5.port_b) annotation(
    Line(points = {{178, -24}, {164, -24}}, color = {0, 127, 255}));
  connect(TrbByPump.port_b, p4.port) annotation(
    Line(points = {{56, -24}, {8, -24}, {8, -38}}, color = {0, 127, 255}));
  connect(TrbByPump.port_a, p5.port) annotation(
    Line(points = {{96, -24}, {140, -24}, {140, -36}}, color = {0, 127, 255}));
  connect(gain.y, TrbByPump.m_flow_set) annotation(
    Line(points = {{86, -69.4}, {86, -40.4}}, color = {0, 0, 127}));
  connect(p5.p, PRtrb.u2) annotation(
    Line(points = {{133.4, -42}, {133.4, -62}, {42.4, -62}}, color = {0, 0, 127}));
  connect(TrbByPump.port_b, T4.port) annotation(
    Line(points = {{56, -24}, {28, -24}, {28, -32}}, color = {0, 127, 255}));
  connect(calc_m_flow_Trb.y, gain.u) annotation(
    Line(points = {{77, -96}, {86, -96}, {86, -83}}, color = {0, 0, 127}));
  connect(Brn.ports[1], CmpByPump.port_b) annotation(
    Line(points = {{-56, -24}, {-56, 106}, {-140, 106}}, color = {0, 127, 255}));
  connect(Brn.ports[2], TrbByPump.port_b) annotation(
    Line(points = {{-56, -24}, {56, -24}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow.port, Brn.heatPort) annotation(
    Line(points = {{-88, -26}, {-66, -26}, {-66, -14}}, color = {191, 0, 0}));
  connect(ramp_heat.y, feedback.u1) annotation(
    Line(points = {{-197, -26}, {-184, -26}}, color = {0, 0, 127}));
  connect(ctrlHeatPI.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-127, -26}, {-109, -26}}, color = {0, 0, 127}));
  connect(feedback.y, ctrlHeatPI.u) annotation(
    Line(points = {{-167, -26}, {-151, -26}}, color = {0, 0, 127}));
  connect(Brn.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-66, -14}, {-78, -14}, {-78, 2}}, color = {191, 0, 0}));
  connect(temperatureSensor.T, feedback.u2) annotation(
    Line(points = {{-90, 2}, {-176, 2}, {-176, -18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -120}, {200, 160}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");

end GasCompressor_and_GasTurbine_byPump_connected_ex01;
