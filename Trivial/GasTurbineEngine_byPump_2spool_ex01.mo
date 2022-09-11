within WalkingInWorldOfThermoFluid.Trivial;

model GasTurbineEngine_byPump_2spool_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  /*
  parameter Real arrFlowCmp[3]={1*0.2, 1*0.3, 1*0.4};
  parameter Real arrHeadCmp[3]={15*20000, 15*5000, 15*0};
  parameter Real arrFlowTrb041[3]={0, 2*(-0.25), 2*(-0.50)};
  parameter Real arrHeadTrb041[3]={2*(-20000), 2*(-18000), 0};
  parameter Real arrFlowTrb049[3]={0, 2*(-0.25), 2*(-0.50)};
  parameter Real arrHeadTrb049[3]={2*(-20000), 2*(-18000), 0};
  */
  //----------
  parameter Real arrFlowCmp[3]={1*0.1, 1*0.2, 1*0.3};
  parameter Real arrHeadCmp[3]={15*20000, 15*10000, 50000};
  parameter Real arrFlowTrb041[3]={-0.2, -0.9, -1};
  parameter Real arrHeadTrb041[3]={-40000, -35000, -5000};
  parameter Real arrFlowTrb049[3]={-0.1, -0.5, -0.8};
  parameter Real arrHeadTrb049[3]={-45000, -40000, -10000};
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-270, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p =  101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb041(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = arrFlowTrb041, head_nominal = arrHeadTrb041), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = -2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 2, height = 100, offset = 1000, startTime = 15) annotation(
    Placement(visible = true, transformation(origin = {232, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {170, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {185, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {250, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset =  101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {200, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump Cmp(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = arrFlowCmp, head_nominal = arrHeadCmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, -30}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrSh annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-205, -30}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-226, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrGen annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Comb030(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 0.01, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {-75, -15}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 2, height = 3000 * 1000, offset = 1000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.01, w(fixed = true, start = 500 * 2 * Modelica.Constants.pi / 60))  annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-151, -114}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {138, -106}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-227, -54}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-141, -62}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {174, -40}, extent = {{14, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-100, -35}, extent = {{-6, -5}, {6, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-88, -62}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-59, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue111(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-47, -61}, extent = {{-15, -9}, {15, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {210, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue13(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {183, -54}, extent = {{15, -9}, {-15, 9}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb049(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = arrFlowTrb049, head_nominal = arrHeadTrb049), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = -2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue41(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {22, -40}, extent = {{14, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p45(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {33, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T45(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {58, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue131(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {33, -54}, extent = {{15, -9}, {-15, 9}}, rotation = 0)));
  Modelica.Blocks.Math.Gain calcWfuel(k = 1 / (43 * 10 ^ 6))  annotation(
    Placement(visible = true, transformation(origin = {-95, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division calcFAR annotation(
    Placement(visible = true, transformation(origin = {-60, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-279, -10}, {-270, -10}, {-270, -22}, {-262, -22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-279, -40}, {-273, -40}, {-273, -26}, {-262, -26}}, color = {0, 0, 127}));
  connect(Cmp.port_b, p3.port) annotation(
    Line(points = {{-140, -30}, {-127, -30}}, color = {0, 127, 255}));
  connect(p1.port, boundary.ports[1]) annotation(
    Line(points = {{-232, -30}, {-240, -30}}, color = {0, 127, 255}));
  connect(p1.port, massFlowRate.port_a) annotation(
    Line(points = {{-232, -30}, {-210, -30}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, Cmp.port_a) annotation(
    Line(points = {{-200, -30}, {-180, -30}}, color = {0, 127, 255}));
  connect(Cmp.shaft, pwrSh.flange_b) annotation(
    Line(points = {{-160, -50}, {-160, -90}, {-140, -90}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{189, -80}, {181, -80}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{221, -80}, {211, -80}}, color = {0, 0, 127}));
  connect(pwrGen.flange_b, speed1.flange) annotation(
    Line(points = {{130, -80}, {160, -80}}));
  connect(prescribedHeatFlow.port, Comb030.heatPort) annotation(
    Line(points = {{-90, 30}, {-90, -15}}, color = {191, 0, 0}));
  connect(ramp_heat.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-129, 30}, {-111, 30}}, color = {0, 0, 127}));
  connect(pwrSh.flange_a, inertia.flange_a) annotation(
    Line(points = {{-120, -90}, {-100, -90}}));
  connect(inertia.flange_b, trb041.shaft) annotation(
    Line(points = {{-80, -90}, {-20, -90}, {-20, -50}}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131, -114}, {-122, -114}, {-122, -100}}, color = {0, 0, 127}));
  connect(pwrGen.power, realValue1.numberPort) annotation(
    Line(points = {{112, -91}, {112, -106}, {120, -106}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-210, -54}, {-205, -54}, {-205, -35.5}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, p3.p) annotation(
    Line(points = {{-124, -62}, {-120, -62}, {-120, -38}}, color = {0, 0, 127}));
  connect(p3.port, T3.port) annotation(
    Line(points = {{-127, -30}, {-100, -30}}, color = {0, 127, 255}));
  connect(Comb030.ports[1], T3.port) annotation(
    Line(points = {{-75, -30}, {-100, -30}}, color = {0, 127, 255}));
  connect(T3.T, realValue11.numberPort) annotation(
    Line(points = {{-104, -35}, {-111, -35}, {-111, -62}, {-106, -62}}, color = {0, 0, 127}));
  connect(Comb030.ports[2], T4.port) annotation(
    Line(points = {{-75, -30}, {-59, -30}}, color = {0, 127, 255}));
  connect(trb041.port_b, T4.port) annotation(
    Line(points = {{-40, -30}, {-59, -30}}, color = {0, 127, 255}));
  connect(T4.T, realValue111.numberPort) annotation(
    Line(points = {{-62.5, -35}, {-68, -35}, {-68, -61}, {-64, -61}}, color = {0, 0, 127}));
  connect(p5.p, realValue4.numberPort) annotation(
    Line(points = {{190.5, -25}, {193, -25}, {193, -40}, {189, -40}}, color = {0, 0, 127}));
  connect(p5.port, T5.port) annotation(
    Line(points = {{185, -30}, {209, -30}}, color = {0, 127, 255}));
  connect(T5.T, realValue13.numberPort) annotation(
    Line(points = {{206.5, -35}, {200, -35}, {200, -54}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], T5.port) annotation(
    Line(points = {{240, -30}, {210, -30}}, color = {0, 127, 255}));
  connect(trb041.port_a, p45.port) annotation(
    Line(points = {{0, -30}, {33, -30}}, color = {0, 127, 255}));
  connect(p45.port, T45.port) annotation(
    Line(points = {{33, -30}, {58, -30}}, color = {0, 127, 255}));
  connect(trb049.port_b, T45.port) annotation(
    Line(points = {{80, -30}, {58, -30}}, color = {0, 127, 255}));
  connect(trb049.port_a, p5.port) annotation(
    Line(points = {{120, -30}, {186, -30}}, color = {0, 127, 255}));
  connect(p45.p, realValue41.numberPort) annotation(
    Line(points = {{38.5, -25}, {44, -25}, {44, -40}, {38, -40}}, color = {0, 0, 127}));
  connect(T45.T, realValue131.numberPort) annotation(
    Line(points = {{54.5, -35}, {50, -35}, {50, -54}}, color = {0, 0, 127}));
  connect(trb049.shaft, pwrGen.flange_a) annotation(
    Line(points = {{100, -50}, {100, -80}, {110, -80}}));
  connect(ramp_heat.y, calcWfuel.u) annotation(
    Line(points = {{-128, 30}, {-124, 30}, {-124, 60}, {-101, 60}}, color = {0, 0, 127}));
  connect(calcWfuel.y, calcFAR.u1) annotation(
    Line(points = {{-90, 60}, {-72, 60}}, color = {0, 0, 127}));
  connect(massFlowRate.m_flow, calcFAR.u2) annotation(
    Line(points = {{-204, -36}, {-194, -36}, {-194, 48}, {-72, 48}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end GasTurbineEngine_byPump_2spool_ex01;
