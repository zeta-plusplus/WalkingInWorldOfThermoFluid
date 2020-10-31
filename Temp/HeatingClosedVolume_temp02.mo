within WalkingInWorldOfThermoFluid.Temp;

model HeatingClosedVolume_temp02
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse_heating(amplitude = 10 * 1000, nperiod = 1, offset = 0, period = 10, startTime = 10, width = 100)  annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = fluid1, clearance = 0.001, pistonCrossArea = 0.01, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(prescribedHeatFlow1.port, sweptVolume1.heatPort) annotation(
    Line(points = {{-30, 40}, {-20, 40}, {-20, 40}, {-20, 40}}, color = {191, 0, 0}));
  connect(pulse_heating.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-59, 40}, {-50, 40}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end HeatingClosedVolume_temp02;
