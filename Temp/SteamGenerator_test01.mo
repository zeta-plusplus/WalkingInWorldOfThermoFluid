within WalkingInWorldOfThermoFluid.Temp;

model SteamGenerator_test01
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 102 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {222, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, T = 90 + 273.15, m_flow = 2, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-226, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.05, length = 1) annotation(
    Placement(visible = true, transformation(origin = {172, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-168, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {138, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {-181, 37}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2 annotation(
    Placement(visible = true, transformation(origin = {153, 69}, extent = {{-11, -9}, {11, 9}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-134, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0*100*1000, offset = 100*1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-162, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-172, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-104, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {224, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3 annotation(
    Placement(visible = true, transformation(origin = {-81, -11}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-81, 8}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2.1*100*1000), p_start = 2.1*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-124, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4 annotation(
    Placement(visible = true, transformation(origin = {178, -35}, extent = {{-10, -9}, {10, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate4(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {166, -16}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.005, length = 1) annotation(
    Placement(visible = true, transformation(origin = {141, -16}, extent = {{-13, -10}, {13, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5 annotation(
    Placement(visible = true, transformation(origin = {-97, 30}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6 annotation(
    Placement(visible = true, transformation(origin = {3, 30}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler1(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2*100*1000), p_start = 2*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-26, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-36, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 4, p_start = 2.1*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-150, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, nPorts = 4, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-52, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-52, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-150, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {-140, -18}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 3) annotation(
    Placement(visible = true, transformation(origin = {-159, -24}, extent = {{11, -8}, {-11, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 3) annotation(
    Placement(visible = true, transformation(origin = {-56, -24}, extent = {{10, -8}, {-10, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {-40, -16}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-74, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, nPorts = 3, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-16, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{182, 48}, {212, 48}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, pipe.port_a) annotation(
    Line(points = {{144, 48}, {162, 48}}, color = {0, 127, 255}));
  connect(realValue.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-170.65, 37}, {-167.65, 37}, {-167.65, 14}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{140.35, 69}, {140.35, 68}, {138, 68}, {138, 55}}, color = {0, 0, 127}));
  connect(ramp.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-151, -86}, {-134, -86}, {-134, -76}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, massFlowRate3.m_flow) annotation(
    Line(points = {{-91.35, -11}, {-91.35, -5}, {-81.35, -5}, {-81.35, 1}}, color = {0, 0, 127}));
  connect(pipe1.port_b, massFlowRate3.port_a) annotation(
    Line(points = {{-94, 8}, {-87, 8}}, color = {0, 127, 255}));
  connect(realValue4.numberPort, massFlowRate4.m_flow) annotation(
    Line(points = {{166.5, -35}, {166.5, -22}, {165.65, -22}}, color = {0, 0, 127}));
  connect(pipe2.port_b, massFlowRate4.port_a) annotation(
    Line(points = {{154, -16}, {160, -16}}, color = {0, 127, 255}));
  connect(massFlowRate4.port_b, boundary3.ports[1]) annotation(
    Line(points = {{172, -16}, {200, -16}, {200, -54}, {214, -54}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.V, realValue5.numberPort) annotation(
    Line(points = {{-113, 30}, {-108, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler1.V, realValue6.numberPort) annotation(
    Line(points = {{-15, 30}, {-8, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.heatPort, prescribedHeatFlow.port) annotation(
    Line(points = {{-134, 26}, {-134, -56}}, color = {191, 0, 0}));
  connect(equilibriumDrumBoiler1.heatPort, prescribedHeatFlow1.port) annotation(
    Line(points = {{-36, 26}, {-36, -66}}, color = {191, 0, 0}));
  connect(ramp.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-151, -86}, {-36, -86}}, color = {0, 0, 127}));
  connect(massFlowRate3.port_b, volume1.ports[1]) annotation(
    Line(points = {{-75, 8}, {-52, 8}}, color = {0, 127, 255}));
  connect(volume1.ports[2], equilibriumDrumBoiler1.port_a) annotation(
    Line(points = {{-52, 8}, {-26, 8}, {-26, 16}}, color = {0, 127, 255}));
  connect(volume1.ports[3], pressure.port) annotation(
    Line(points = {{-52, 8}, {-52, 2}}, color = {0, 127, 255}));
  connect(pressure1.port, volume.ports[1]) annotation(
    Line(points = {{-150, 2}, {-150, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_a, volume.ports[2]) annotation(
    Line(points = {{-124, 16}, {-124, 8}, {-150, 8}}, color = {0, 127, 255}));
  connect(volume.ports[3], pipe1.port_a) annotation(
    Line(points = {{-150, 8}, {-114, 8}}, color = {0, 127, 255}));
  connect(pressure1.p, gain.u) annotation(
    Line(points = {{-142.3, -5}, {-140.3, -5}, {-140.3, -14}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain.y) annotation(
    Line(points = {{-146.35, -24}, {-140.35, -24}, {-140.35, -22}}, color = {0, 0, 127}));
  connect(gain1.u, pressure.p) annotation(
    Line(points = {{-40, -11.2}, {-40, -4.2}, {-44, -4.2}}, color = {0, 0, 127}));
  connect(realValue7.numberPort, gain1.y) annotation(
    Line(points = {{-44.5, -24}, {-40, -24}, {-40, -20}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, volume.ports[4]) annotation(
    Line(points = {{-162, 8}, {-150, 8}}, color = {0, 127, 255}));
  connect(massFlowRate.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-174, 8}, {-216, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_b, pipe3.port_a) annotation(
    Line(points = {{-124, 36}, {-124, 48}, {-84, 48}}, color = {0, 127, 255}));
  connect(pipe2.port_a, volume1.ports[4]) annotation(
    Line(points = {{128, -16}, {76, -16}, {76, 8}, {-52, 8}}, color = {0, 127, 255}));
  connect(pipe3.port_b, volume2.ports[1]) annotation(
    Line(points = {{-64, 48}, {-16, 48}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler1.port_b, volume2.ports[2]) annotation(
    Line(points = {{-26, 36}, {-26, 48}, {-16, 48}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_a, volume2.ports[3]) annotation(
    Line(points = {{132, 48}, {-16, 48}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -100}, {240, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    Icon(coordinateSystem(extent = {{-240, -100}, {240, 100}})));
end SteamGenerator_test01;
