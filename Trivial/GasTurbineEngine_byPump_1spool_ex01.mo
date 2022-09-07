within WalkingInWorldOfThermoFluid.Trivial;

model GasTurbineEngine_byPump_1spool_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-170, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p =  101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real kHeadTrb=10;
  parameter Real kFlowTrb=1;
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {kFlowTrb*0, kFlowTrb*(-0.25), kFlowTrb*(-0.50)}, head_nominal = {kHeadTrb*(-20000), kHeadTrb*(-15000), kHeadTrb*0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 10000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = -2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 0, offset = 10000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {122, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {60, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p5(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {130, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset =  101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  parameter Real kHeadCmp=10;
  parameter Real kFlowCmp=1;
  Modelica.Fluid.Machines.Pump Cmp(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {kFlowCmp*0, kFlowCmp*0.25, kFlowCmp*0.50}, head_nominal = {kHeadCmp*20000, kHeadCmp*15000, kHeadCmp*0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 10000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrSh annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-200, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-220, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrGen annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Comb030(redeclare package Medium = Modelica.Media.Air.DryAirNasa, V = 0.01, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in1(duration = 10, height = 100 * 1000, offset = 1000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.01)  annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5)  annotation(
    Placement(visible = true, transformation(origin = {-151, -114}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {18, -116}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-223, -76}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-141, -56}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {14, -40}, extent = {{14, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-96, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-88, -62}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T4(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-54, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue111(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-47, -61}, extent = {{-15, -9}, {15, 9}}, rotation = 0)));
equation
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-279, -10}, {-270, -10}, {-270, -22}, {-262, -22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-279, -40}, {-273, -40}, {-273, -26}, {-262, -26}}, color = {0, 0, 127}));
  connect(Cmp.port_b, p3.port) annotation(
    Line(points = {{-150, -30}, {-130, -30}}, color = {0, 127, 255}));
  connect(p1.port, boundary.ports[1]) annotation(
    Line(points = {{-230, -30}, {-240, -30}}, color = {0, 127, 255}));
  connect(p1.port, massFlowRate.port_a) annotation(
    Line(points = {{-230, -30}, {-210, -30}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, Cmp.port_a) annotation(
    Line(points = {{-190, -30}, {-170, -30}}, color = {0, 127, 255}));
  connect(trb.port_a, p5.port) annotation(
    Line(points = {{-20, -30}, {20, -30}}, color = {0, 127, 255}));
  connect(Cmp.shaft, pwrSh.flange_b) annotation(
    Line(points = {{-160, -40}, {-160, -90}, {-140, -90}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{80, -90}, {72, -90}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{112, -90}, {102, -90}}, color = {0, 0, 127}));
  connect(trb.shaft, pwrGen.flange_a) annotation(
    Line(points = {{-30, -40}, {-30, -90}, {-10, -90}}));
  connect(pwrGen.flange_b, speed1.flange) annotation(
    Line(points = {{10, -90}, {50, -90}}));
  connect(prescribedHeatFlow.port, Comb030.heatPort) annotation(
    Line(points = {{-90, 10}, {-90, -20}}, color = {191, 0, 0}));
  connect(ramp_p_in1.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-119, 10}, {-111, 10}}, color = {0, 0, 127}));
  connect(pwrSh.flange_a, inertia.flange_a) annotation(
    Line(points = {{-120, -90}, {-100, -90}}));
  connect(inertia.flange_b, trb.shaft) annotation(
    Line(points = {{-80, -90}, {-30, -90}, {-30, -40}}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131, -114}, {-122, -114}, {-122, -100}}, color = {0, 0, 127}));
  connect(pwrGen.power, realValue1.numberPort) annotation(
    Line(points = {{-8, -101}, {-8, -116}, {0, -116}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-206, -76}, {-200, -76}, {-200, -40}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, p3.p) annotation(
    Line(points = {{-124, -56}, {-120, -56}, {-120, -40}}, color = {0, 0, 127}));
  connect(p3.port, T3.port) annotation(
    Line(points = {{-130, -30}, {-96, -30}}, color = {0, 127, 255}));
  connect(Comb030.ports[1], T3.port) annotation(
    Line(points = {{-80, -30}, {-96, -30}}, color = {0, 127, 255}));
  connect(T3.T, realValue11.numberPort) annotation(
    Line(points = {{-103, -40}, {-111, -40}, {-111, -62}, {-106, -62}}, color = {0, 0, 127}));
  connect(Comb030.ports[2], T4.port) annotation(
    Line(points = {{-80, -30}, {-54, -30}}, color = {0, 127, 255}));
  connect(trb.port_b, T4.port) annotation(
    Line(points = {{-40, -30}, {-54, -30}}, color = {0, 127, 255}));
  connect(T4.T, realValue111.numberPort) annotation(
    Line(points = {{-60, -40}, {-68, -40}, {-68, -61}, {-64, -61}}, color = {0, 0, 127}));
  connect(p5.p, realValue4.numberPort) annotation(
    Line(points = {{32, -20}, {34, -20}, {34, -40}, {30, -40}}, color = {0, 0, 127}));
  connect(p5.port, boundary1.ports[1]) annotation(
    Line(points = {{20, -30}, {120, -30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {140, 100}}, initialScale = 0.1), graphics = {Text(origin = {-120, 13}, extent = {{62, -1}, {140, -8}}, textString = "gas turbine by 'pump' component")}),
    __OpenModelica_commandLineOptions = "");
end GasTurbineEngine_byPump_1spool_ex01;
