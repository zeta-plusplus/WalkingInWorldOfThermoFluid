within WalkingInWorldOfThermoFluid.Temp;

model SteamGenerator_test02
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 110 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {138, 52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, T = 100 + 273.15, m_flow = 2, nPorts = 1) annotation(
    Placement(transformation(origin = {-190, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.01, length = 1) annotation(
    Placement(transformation(origin = {88, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-158, 8}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {54, 52}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(transformation(origin = {-171, 37}, extent = {{9, -9}, {-9, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2 annotation(
    Placement(transformation(origin = {69, 72}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(transformation(origin = {-92, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0, offset = 1000*1000, startTime = 2) annotation(
    Placement(transformation(origin = {-112, -70}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-166, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3 annotation(
    Placement(transformation(origin = {-9, -11}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-26, 8}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler(redeclare package Medium = fluid1, V_t = 0.1, cp_D = 0.1, m_D = 0.001, p(start = 100*1000), p_start = 2*100*1000) annotation(
    Placement(transformation(origin = {-82, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 3) annotation(
    Placement(transformation(origin = {-53, 30}, extent = {{-11, -9}, {11, 9}})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, nPorts = 3, p_start = 100*1000, use_portsData = false) annotation(
    Placement(transformation(origin = {27, 59}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.Density density(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {39, 86}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4) annotation(
    Placement(transformation(origin = {68, 86}, extent = {{-12, -9}, {12, 9}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.01, length = 1) annotation(
    Placement(visible = true, transformation(origin = {14, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-82, -11}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 4, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-127, 15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, -19}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump pump(redeclare package Medium = fluid1, control_m_flow = false, use_m_flow_set = false, use_p_set = false)  annotation(
    Placement(visible = true, transformation(origin = {-31, -34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(boundary1.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{-180, 8}, {-164, 8}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{98, 52}, {128, 52}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, pipe.port_a) annotation(
    Line(points = {{60, 52}, {78, 52}}, color = {0, 127, 255}));
  connect(realValue.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-160.65, 37}, {-157.65, 37}, {-157.65, 14}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{59, 72}, {53.65, 72}, {53.65, 59}}, color = {0, 0, 127}));
  connect(ramp.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-101, -70}, {-92, -70}, {-92, -54}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, massFlowRate3.m_flow) annotation(
    Line(points = {{-19.35, -11}, {-26.35, -11}, {-26.35, 2}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.V, realValue5.numberPort) annotation(
    Line(points = {{-71, 30}, {-66, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.heatPort, prescribedHeatFlow.port) annotation(
    Line(points = {{-92, 26}, {-92, -34}}, color = {191, 0, 0}));
  connect(volume1.ports[1], massFlowRate2.port_a) annotation(
    Line(points = {{27, 52}, {47, 52}}, color = {0, 127, 255}));
  connect(volume1.ports[2], equilibriumDrumBoiler.port_b) annotation(
    Line(points = {{28, 52}, {-82, 52}, {-82, 36}}, color = {0, 127, 255}));
  connect(volume1.ports[3], density.port) annotation(
    Line(points = {{28, 52}, {39, 52}, {39, 81}}, color = {0, 127, 255}));
  connect(density.d, realValue7.numberPort) annotation(
    Line(points = {{44.5, 86}, {54, 86}}, color = {0, 0, 127}));
  connect(pipe1.port_a, massFlowRate3.port_b) annotation(
    Line(points = {{4, 8}, {-20, 8}}, color = {0, 127, 255}));
  connect(massFlowRate3.port_a, equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-32, 8}, {-82, 8}, {-82, 16}}, color = {0, 127, 255}));
  connect(pressure.port, equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-82, -4}, {-82, 16}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, volume.ports[1]) annotation(
    Line(points = {{-152, 8}, {-127, 8}}, color = {0, 127, 255}));
  connect(volume.ports[2], equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-127, 8}, {-82, 8}, {-82, 16}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume2.ports[1]) annotation(
    Line(points = {{24, 8}, {54, 8}, {54, -26}}, color = {0, 127, 255}));
  connect(pump.port_a, volume2.ports[2]) annotation(
    Line(points = {{-20, -34}, {54, -34}, {54, -26}}, color = {0, 127, 255}));
  connect(pump.port_b, volume.ports[3]) annotation(
    Line(points = {{-40, -34}, {-127, -34}, {-127, 8}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.05));
end SteamGenerator_test02;
