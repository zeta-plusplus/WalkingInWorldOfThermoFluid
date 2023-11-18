within WalkingInWorldOfThermoFluid.Temp;

model PipeLine_and_Valve_Advection_01
  extends Modelica.Icons.Example;
  //*****
  replaceable package fluid1 = Modelica.Media.Water.StandardWater;
  //replaceable package fluid1 = FluidSystemComponents.Media.HydrogenCoolProp
  //redeclare package Medium = fluid1
  //*****
  parameter Real kVol=1.0;
  parameter Integer nVol = 11;
  parameter Modelica.Units.SI.Length lenPipe = 1.0;
  parameter Modelica.Units.SI.Length diamPipe = 0.05;
  parameter Modelica.Units.SI.Temperature Ts_init[nVol] = {
    290, 290, 290, 290, 290,
    290, 290, 290, 290, 290,
    290
    };
  //*****
  Real arr_x[nVol];
  Modelica.Units.SI.Temperature arr_T[nVol];
  Modelica.Units.SI.Pressure arr_p[nVol];
  //***********************************
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-44, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = Ts_init[1] + 40, nPorts = 1, p = 400*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-348, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-318, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = Ts_init[1], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-295, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = Ts_init[nVol], nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {488, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = Ts_init[2], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-221, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-244, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, T_start = Ts_init[3], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-148, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-172, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.1, height = 500*1000, offset = 100*1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-380, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, T_start = Ts_init[4], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-69, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, T_start = Ts_init[5], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {7, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-16, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, T_start = Ts_init[6], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {81, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {58, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume6(redeclare package Medium = fluid1, T_start = Ts_init[7], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {151, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume7(redeclare package Medium = fluid1, T_start = Ts_init[8], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {221, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {198, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe8(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {268, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume8(redeclare package Medium = fluid1, T_start = Ts_init[9], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {291, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume9(redeclare package Medium = fluid1, T_start = Ts_init[10], V = lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {365, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe9(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {340, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow(redeclare package Medium = fluid1, T_start_in = Ts_init[1], T_start_out = Ts_init[2], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-273, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow1(redeclare package Medium = fluid1, T_start_in = Ts_init[2], T_start_out = Ts_init[3], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-199, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow2(redeclare package Medium = fluid1, T_start_in = Ts_init[3], T_start_out = Ts_init[4], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-125, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow3(redeclare package Medium = fluid1, T_start_in = Ts_init[4], T_start_out = Ts_init[5], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-47, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow4(redeclare package Medium = fluid1, T_start_in = Ts_init[5], T_start_out = Ts_init[6], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {31, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow5(redeclare package Medium = fluid1, T_start_in = Ts_init[6], T_start_out = Ts_init[7], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {103, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow6(redeclare package Medium = fluid1, T_start_in = Ts_init[7], T_start_out = Ts_init[8], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {173, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow7(redeclare package Medium = fluid1, T_start_in = Ts_init[8], T_start_out = Ts_init[9], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {243, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Buildings.Fluid.FixedResistances.BaseClasses.PlugFlow plugFlow8(redeclare package Medium = fluid1, T_start_in = Ts_init[9], T_start_out = Ts_init[10], dh = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {313, 10}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume10(redeclare package Medium = fluid1, T_start = Ts_init[11], V = kVol*lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {419, 10}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe10(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {450, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve(redeclare package Medium = fluid1, dp_nominal = 10*1000, m_flow_nominal = 10) annotation(
    Placement(visible = true, transformation(origin = {392, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 1, height = -1, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {370, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-338, 10}, {-328, 10}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume1.ports[1]) annotation(
    Line(points = {{-234, 10}, {-228, 10}}, color = {0, 127, 255}));
  connect(pipe2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-162, 10}, {-155, 10}}, color = {0, 127, 255}));
//*****
  for i in 1:nVol loop
    arr_x[i] = i;
  end for;
//
  arr_T[1] = volume.medium.T;
  arr_T[2] = volume1.medium.T;
  arr_T[3] = volume2.medium.T;
  arr_T[4] = volume3.medium.T;
  arr_T[5] = volume4.medium.T;
  arr_T[6] = volume5.medium.T;
  arr_T[7] = volume6.medium.T;
  arr_T[8] = volume7.medium.T;
  arr_T[9] = volume8.medium.T;
  arr_T[10] = volume9.medium.T;
  arr_T[11] = volume10.medium.T;
//
  arr_p[1] = volume.medium.p;
  arr_p[2] = volume1.medium.p;
  arr_p[3] = volume2.medium.p;
  arr_p[4] = volume3.medium.p;
  arr_p[5] = volume4.medium.p;
  arr_p[6] = volume5.medium.p;
  arr_p[7] = volume6.medium.p;
  arr_p[8] = volume7.medium.p;
  arr_p[9] = volume8.medium.p;
  arr_p[10] = volume9.medium.p;
  arr_p[11] = volume10.medium.p;
//*****
  connect(ramp.y, boundary.p_in) annotation(
    Line(points = {{-369, 18}, {-360, 18}}, color = {0, 0, 127}));
  connect(pipe3.port_b, volume3.ports[1]) annotation(
    Line(points = {{-82, 10}, {-76, 10}}, color = {0, 127, 255}));
  connect(volume4.ports[1], pipe4.port_b) annotation(
    Line(points = {{(-0 - 16), 10}, {-6, 10}}, color = {0, 127, 255}));
  connect(volume5.ports[1], pipe5.port_b) annotation(
    Line(points = {{74, 10}, {68, 10}}, color = {0, 127, 255}));
  connect(volume6.ports[1], pipe6.port_b) annotation(
    Line(points = {{144, 10}, {138, 10}}, color = {0, 127, 255}));
  connect(volume7.ports[1], pipe7.port_b) annotation(
    Line(points = {{214, 10}, {208, 10}}, color = {0, 127, 255}));
  connect(volume8.ports[1], pipe8.port_b) annotation(
    Line(points = {{284, 10}, {278, 10}}, color = {0, 127, 255}));
  connect(pipe9.port_b, volume9.ports[1]) annotation(
    Line(points = {{350, 10}, {358, 10}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-308, 10}, {-302, 10}}, color = {0, 127, 255}));
  connect(volume.ports[2], plugFlow.port_a) annotation(
    Line(points = {{-302, 10}, {-280, 10}}, color = {0, 127, 255}));
  connect(plugFlow.port_b, pipe1.port_a) annotation(
    Line(points = {{-266, 10}, {-254, 10}}, color = {0, 127, 255}));
  connect(volume1.ports[2], plugFlow1.port_a) annotation(
    Line(points = {{-228, 10}, {-206, 10}}, color = {0, 127, 255}));
  connect(plugFlow1.port_b, pipe2.port_a) annotation(
    Line(points = {{-192, 10}, {-182, 10}}, color = {0, 127, 255}));
  connect(volume2.ports[2], plugFlow2.port_a) annotation(
    Line(points = {{-155, 10}, {-133, 10}}, color = {0, 127, 255}));
  connect(plugFlow2.port_b, pipe3.port_a) annotation(
    Line(points = {{-118, 10}, {-102, 10}}, color = {0, 127, 255}));
  connect(volume3.ports[2], plugFlow3.port_a) annotation(
    Line(points = {{-76, 10}, {-54, 10}}, color = {0, 127, 255}));
  connect(plugFlow3.port_b, pipe4.port_a) annotation(
    Line(points = {{-40, 10}, {-26, 10}}, color = {0, 127, 255}));
  connect(volume4.ports[2], plugFlow4.port_a) annotation(
    Line(points = {{(-0 - 16), 10}, {24, 10}}, color = {0, 127, 255}));
  connect(plugFlow4.port_b, pipe5.port_a) annotation(
    Line(points = {{38, 10}, {48, 10}}, color = {0, 127, 255}));
  connect(volume5.ports[2], plugFlow5.port_a) annotation(
    Line(points = {{74, 10}, {96, 10}}, color = {0, 127, 255}));
  connect(plugFlow5.port_b, pipe6.port_a) annotation(
    Line(points = {{110, 10}, {118, 10}}, color = {0, 127, 255}));
  connect(volume6.ports[2], plugFlow6.port_a) annotation(
    Line(points = {{144, 10}, {166, 10}}, color = {0, 127, 255}));
  connect(plugFlow6.port_b, pipe7.port_a) annotation(
    Line(points = {{180, 10}, {188, 10}}, color = {0, 127, 255}));
  connect(volume7.ports[2], plugFlow7.port_a) annotation(
    Line(points = {{214, 10}, {236, 10}}, color = {0, 127, 255}));
  connect(plugFlow7.port_b, pipe8.port_a) annotation(
    Line(points = {{250, 10}, {258, 10}}, color = {0, 127, 255}));
  connect(volume8.ports[2], plugFlow8.port_a) annotation(
    Line(points = {{284, 10}, {306, 10}}, color = {0, 127, 255}));
  connect(pipe9.port_a, plugFlow8.port_b) annotation(
    Line(points = {{330, 10}, {320, 10}}, color = {0, 127, 255}));
  connect(valve.port_b, volume10.ports[1]) annotation(
    Line(points = {{402, 10}, {412, 10}}, color = {0, 127, 255}));
  connect(pipe10.port_a, volume10.ports[2]) annotation(
    Line(points = {{440, 10}, {412, 10}}, color = {0, 127, 255}));
  connect(valve.port_a, volume9.ports[2]) annotation(
    Line(points = {{382, 10}, {358, 10}}, color = {0, 127, 255}));
  connect(pipe10.port_b, boundary1.ports[1]) annotation(
    Line(points = {{460, 10}, {478, 10}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valve.opening) annotation(
    Line(points = {{382, 46}, {392, 46}, {392, 18}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0"), Buildings(version = "9.1.0")),
    Diagram(coordinateSystem(extent = {{-400, -100}, {500, 100}})),
    version = "",
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01));
end PipeLine_and_Valve_Advection_01;
