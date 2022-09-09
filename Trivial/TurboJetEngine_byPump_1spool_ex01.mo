within WalkingInWorldOfThermoFluid.Trivial;

model TurboJetEngine_byPump_1spool_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  parameter Real kHeadCmp=10;
  parameter Real kFlowCmp=10;
  parameter Real kHeadTrb041=2;
  parameter Real kFlowTrb041=10;
  parameter Real kHeadTrb049=2;
  parameter Real kFlowTrb049=1;
  
  parameter Real V_flow_cmp[3] = {kFlowCmp*0, kFlowCmp*0.25, kFlowCmp*0.50};
  parameter Real head_cmp[3] = {kHeadCmp*20000, kHeadCmp*15000, kHeadCmp*0};
  parameter Real V_flow_trb041[3]={kFlowTrb041*0, kFlowTrb041*(-0.25), kFlowTrb041*(-0.50)};
  parameter Real head_trb041[3] = {kHeadTrb041*(-20000), kHeadTrb041*(-15000), kHeadTrb041*0};
  
  
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-170, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p =  101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb041(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = V_flow_trb041, head_nominal = head_trb041), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = -2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p9(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {205, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {250, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset =  101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump Cmp(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = V_flow_cmp, head_nominal = head_cmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, -30}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrSh annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-205, -30}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-226, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume Comb030(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 0.01, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {-75, -15}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 2, height = 1000 * 1000, offset = 1000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.0001, w(fixed = true, start = 1000 * 2 * Modelica.Constants.pi / 60))  annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-151, -114}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-227, -54}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-141, -62}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {194, -40}, extent = {{14, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-100, -35}, extent = {{-6, -5}, {6, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-88, -62}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-59, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue111(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-47, -61}, extent = {{-15, -9}, {15, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T9(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {230, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue13(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {203, -54}, extent = {{15, -9}, {-15, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue41(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {22, -40}, extent = {{14, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p45(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {33, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T45(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {58, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue131(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {33, -54}, extent = {{15, -9}, {-15, 9}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible Noz070(redeclare package Medium = Modelica.Media.Air.DryAirNasa, dp_nominal(displayUnit = "Pa") = 150 * 1000, m_flow_nominal = 30, p_nominal = 150 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_opening_noz070(duration = 2, height = 0.1, offset = 0.9, startTime = 15) annotation(
    Placement(visible = true, transformation(origin = {140, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
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
  connect(prescribedHeatFlow.port, Comb030.heatPort) annotation(
    Line(points = {{-90, 30}, {-90, -15}}, color = {191, 0, 0}));
  connect(ramp_heat.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-119, 30}, {-111, 30}}, color = {0, 0, 127}));
  connect(pwrSh.flange_a, inertia.flange_a) annotation(
    Line(points = {{-120, -90}, {-100, -90}}));
  connect(inertia.flange_b, trb041.shaft) annotation(
    Line(points = {{-80, -90}, {-20, -90}, {-20, -50}}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131, -114}, {-122, -114}, {-122, -100}}, color = {0, 0, 127}));
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
  connect(p9.p, realValue4.numberPort) annotation(
    Line(points = {{210.5, -25}, {213, -25}, {213, -40}, {209, -40}}, color = {0, 0, 127}));
  connect(p9.port, T9.port) annotation(
    Line(points = {{205, -30}, {229, -30}}, color = {0, 127, 255}));
  connect(T9.T, realValue13.numberPort) annotation(
    Line(points = {{226.5, -35}, {220, -35}, {220, -54}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], T9.port) annotation(
    Line(points = {{240, -30}, {230, -30}}, color = {0, 127, 255}));
  connect(trb041.port_a, p45.port) annotation(
    Line(points = {{0, -30}, {33, -30}}, color = {0, 127, 255}));
  connect(p45.port, T45.port) annotation(
    Line(points = {{33, -30}, {58, -30}}, color = {0, 127, 255}));
  connect(p45.p, realValue41.numberPort) annotation(
    Line(points = {{38.5, -25}, {44, -25}, {44, -40}, {38, -40}}, color = {0, 0, 127}));
  connect(T45.T, realValue131.numberPort) annotation(
    Line(points = {{54.5, -35}, {50, -35}, {50, -54}}, color = {0, 0, 127}));
  connect(T45.port, Noz070.port_a) annotation(
    Line(points = {{58, -30}, {120, -30}}, color = {0, 127, 255}));
  connect(Noz070.port_b, p9.port) annotation(
    Line(points = {{160, -30}, {205, -30}}, color = {0, 127, 255}));
  connect(ramp_opening_noz070.y, Noz070.opening) annotation(
    Line(points = {{140, 17}, {140, -15}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end TurboJetEngine_byPump_1spool_ex01;
