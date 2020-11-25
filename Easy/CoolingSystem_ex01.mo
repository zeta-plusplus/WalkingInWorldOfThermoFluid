within WalkingInWorldOfThermoFluid.Easy;

model CoolingSystem_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  replaceable package fluid1 = Modelica.Media.Incompressible.Examples.Glycol47;
  //replaceable package fluid1 = Modelica.Media.Incompressible.Examples.Essotherm650;
  //redeclare package Medium = fluid1
  //-----
  replaceable package fluid2 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid2
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pump_N(duration = 10, height = 0, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = fluid1, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe cooler_hside(redeclare package Medium = fluid1, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 10, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = fluid1, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = fluid2, T = 15 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe cooler_cside(redeclare package Medium = fluid2, T_start = 15 + 273.15, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = cooler_hside.nNodes, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid2, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {190, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1[cooler_hside.nNodes](C = 1000) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = cooler_hside.nNodes) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator2(nout = cooler_cside.nNodes) annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 5000) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = 1 * 0.001, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {200, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {200, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat_generation(duration = 10, height = 100 * 1000, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {180, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe1(redeclare package Medium = fluid1, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {170, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = fluid1, nPorts = 1, p = 101.325 * 1000, use_h_in = true) annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume tank(redeclare package Medium = fluid1, T_start = 15 + 273.15, V = 20 * 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {110, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid2, T_start = 15 + 273.15, V = 1 * 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(heatCapacitor1.port, convection2.fluid) annotation(
    Line(points = {{90, 0}, {90, 10}}, color = {191, 0, 0}));
  connect(convection1.fluid, heatCapacitor1.port) annotation(
    Line(points = {{90, -10}, {90, 0}}, color = {191, 0, 0}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-60, 50}, {-50, 50}, {-50, 30}}));
  connect(powerSensor1.flange_b, pump1.shaft) annotation(
    Line(points = {{-50, 10}, {-50, -15}, {-40, -15}, {-40, -40}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-89, 50}, {-83, 50}, {-83, 50}, {-83, 50}}, color = {0, 0, 127}));
  connect(ramp_pump_N.y, from_rpm1.u) annotation(
    Line(points = {{-119, 70}, {-116, 70}, {-116, 50}, {-113, 50}}, color = {0, 0, 127}));
  connect(cooler_cside.port_b, volume1.ports[1]) annotation(
    Line(points = {{100, 50}, {140, 50}}, color = {0, 127, 255}));
  connect(volume1.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{140, 50}, {162, 50}, {162, 70}, {180, 70}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary2.ports[1], cooler_cside.port_a) annotation(
    Line(points = {{0, 70}, {50, 70}, {50, 50}, {80, 50}}, color = {0, 127, 255}));
  connect(ramp_heat_generation.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{191, -10}, {199, -10}, {199, -20}, {199, -20}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{200, -40}, {200, -40}, {200, -60}, {200, -60}}, color = {191, 0, 0}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{180, -50}, {190, -50}, {190, -70}, {190, -70}}, color = {0, 127, 255}));
  connect(cooler_hside.port_b, pipe.port_a) annotation(
    Line(points = {{100, -50}, {160, -50}}, color = {0, 127, 255}));
  connect(pipe1.port_a, volume.ports[2]) annotation(
    Line(points = {{180, -110}, {190, -110}, {190, -70}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, pipe1.port_b) annotation(
    Line(points = {{110, -110}, {160, -110}}, color = {0, 127, 255}));
  connect(tank.ports[2], pump1.port_a) annotation(
    Line(points = {{-70, -50}, {-50, -50}, {-50, -50}, {-50, -50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], tank.ports[1]) annotation(
    Line(points = {{-90, -50}, {-72, -50}, {-72, -50}, {-70, -50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(specificEnthalpy.h_out, boundary.h_in) annotation(
    Line(points = {{99, -120}, {-126, -120}, {-126, -46}, {-112, -46}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], specificEnthalpy.port) annotation(
    Line(points = {{80, -100}, {95, -100}, {95, -110}, {110, -110}}, color = {0, 127, 255}));
  connect(const.y, replicator2.u) annotation(
    Line(points = {{41, 0}, {43, 0}, {43, 20}, {47, 20}, {47, 20}}, color = {0, 0, 127}));
  connect(const.y, replicator1.u) annotation(
    Line(points = {{41, 0}, {43, 0}, {43, -20}, {47, -20}, {47, -20}}, color = {0, 0, 127}));
  connect(convection2.solid, cooler_cside.heatPorts) annotation(
    Line(points = {{90, 30}, {90, 30}, {90, 46}, {90, 46}}, color = {191, 0, 0}, thickness = 0.5));
  connect(replicator2.y, convection2.Gc) annotation(
    Line(points = {{71, 20}, {80, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(replicator1.y, convection1.Gc) annotation(
    Line(points = {{71, -20}, {80, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(convection1.solid, cooler_hside.heatPorts) annotation(
    Line(points = {{90, -30}, {90, -30}, {90, -46}, {90, -46}}, color = {191, 0, 0}, thickness = 0.5));
  connect(volumeFlowRate1.port_b, cooler_hside.port_a) annotation(
    Line(points = {{0, -50}, {80, -50}}, color = {0, 127, 255}));
  connect(pump1.port_b, volumeFlowRate1.port_a) annotation(
    Line(points = {{-30, -50}, {-20, -50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -140}, {240, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {78, 6}, extent = {{-64, 70}, {40, -74}}), Text(origin = {64, 84}, extent = {{-34, 4}, {34, -4}}, textString = "Heat Exchanger"), Text(origin = {-8, 56}, extent = {{-34, 4}, {34, -4}}, textString = "coolant flow line")}),
    __OpenModelica_commandLineOptions = "");
end CoolingSystem_ex01;
