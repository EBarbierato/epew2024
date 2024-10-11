clear all


G1 = 0.333;
G2 = 12;
R1 = 0.2;
R2 = 2.5;

NBins = 15;

TMax = 12;
TSamp = 0.01; 

NRuns = 10000;

BinThr = 0.75;

HandleAlarm = 0;
ContinueFromWhereItStopped = 0;

SxT = [0 1.59416666666667 1 0 1;
1.59416666666667 3.18833333333333 1 0 2;
3.18833333333333 6.18833333333333 2 1 2;
6.18833333333333 7.41333333333333 1 0 2;
7.41333333333333 9.08833333333333 1 0 3;
9.08833333333333 9.53833333333333 1 0 4;
9.53833333333333 12.5383333333333 2 2 4;
12.5383333333333 13.7466666666667 1 0 4;
13.7466666666667 14.955 1 0 5;
14.955 17.955 2 3 5;
17.955 18.38 1 0 5;
18.38 19.255 1 0 6;
19.255 19.705 1 0 7;
19.705 22.705 2 4 7;
22.705 23.9466666666667 1 0 7;
23.9466666666667 25.1883333333333 1 0 8;
25.1883333333333 28.1883333333333 2 5 8;
28.1883333333333 29.775 1 0 8;
29.775 31.3616666666667 1 0 9;
31.3616666666667 34.3616666666667 2 6 9;
34.3616666666667 36.0533333333333 1 0 9;
36.0533333333333 38.0041666666667 1 0 10;
38.0041666666667 38.2633333333333 1 0 11;
38.2633333333333 41.2633333333333 2 7 11;
41.2633333333333 42.6216666666667 1 0 11;
42.6216666666667 43.98 1 0 12;
43.98 46.98 2 8 12;
46.98 49.4966666666667 1 0 12;
49.4966666666667 52.0133333333333 1 0 13;
52.0133333333333 55.0133333333333 2 9 13;
55.0133333333333 56.1966666666667 1 0 13;
56.1966666666667 57.38 1 0 14;
57.38 60.38 2 10 14;
60.38 62.0633333333333 1 0 14;
62.0633333333333 63.1175 1 0 15;
63.1175 64.1716666666667 1 0 16;
64.1716666666667 64.38 1 0 17;
64.38 67.38 2 11 17;
67.38 68.4383333333333 1 0 17;
68.4383333333333 69.4966666666667 1 0 18;
69.4966666666667 72.4966666666667 2 12 18;
72.4966666666667 72.9633333333333 1 0 18;
72.9633333333333 74.3 1 0 19;
74.3 75.17 1 0 20;
75.17 78.17 2 13 20;
78.17 79.3283333333333 1 0 20;
79.3283333333333 80.4866666666667 1 0 21;
80.4866666666667 83.4866666666667 2 14 21;
83.4866666666667 85.82 1 0 21;
85.82 88.1533333333333 1 0 22;
88.1533333333333 91.1533333333333 2 15 22;
91.1533333333333 92.3216666666667 1 0 22;
92.3216666666667 93.49 1 0 1;
93.49 120 0 0 1];

ReachT = [0 3.18833333333333 6.53833333333333 8.955 10.705 13.1883333333333 16.3616666666667 18.79 21.5066666666667 18.3216666666667 15.955 11.955 9.83833333333333 9.32 7.00333333333333 2.33666666666667;
3.18833333333333 0 3.35 5.76666666666667 7.51666666666667 10 13.1733333333333 15.6016666666667 18.3183333333333 15.1333333333333 12.7666666666667 8.76666666666667 6.65 7.45666666666667 9.77333333333333 5.525;
5.63833333333333 2.45 0.9 3.31666666666667 5.06666666666667 7.55 10.7233333333333 13.1516666666667 15.8683333333333 12.6833333333333 10.3166666666667 6.31666666666667 4.2 5.00666666666667 7.32333333333333 7.975;
6.53833333333333 3.35 0 2.41666666666667 4.16666666666667 6.65 9.82333333333333 13.085 15.8016666666667 12.6166666666667 10.25 7.08333333333333 5.1 5.90666666666667 8.22333333333333 8.875;
8.955 5.76666666666667 2.41666666666667 0 1.75 4.23333333333333 7.40666666666667 10.6683333333333 13.385 10.2 7.83333333333333 4.66666666666667 6.78333333333333 8.32333333333333 10.64 11.2916666666667;
9.805 6.61666666666667 3.26666666666667 0.85 0.9 3.38333333333333 6.55666666666667 9.81833333333333 12.535 9.35 6.98333333333333 3.81666666666667 5.93333333333333 8.60666666666667 10.9233333333333 12.1416666666667;
10.705 7.51666666666667 4.16666666666667 1.75 0 2.48333333333333 5.65666666666667 9.55833333333333 12.275 10.25 7.88333333333333 4.71666666666667 6.83333333333333 9.50666666666667 11.8233333333333 13.0416666666667;
13.1883333333333 10 6.65 4.23333333333333 2.48333333333333 0 3.17333333333333 7.075 9.79166666666667 12.7333333333333 10.3666666666667 7.2 9.31666666666667 11.99 14.3066666666667 15.525;
16.3616666666667 13.1733333333333 9.82333333333333 7.40666666666667 5.65666666666667 3.17333333333333 0 3.90166666666667 6.61833333333333 10.1666666666667 7.8 9.7 11.8166666666667 14.49 16.8066666666667 18.6983333333333;
18.2716666666667 15.0833333333333 12.5666666666667 10.15 9.04 6.55666666666667 3.38333333333333 0.518333333333333 3.235 6.78333333333333 4.41666666666667 6.31666666666667 8.43333333333333 11.1066666666667 13.4233333333333 18.09;
18.79 15.6016666666667 13.085 10.6683333333333 9.55833333333333 7.075 3.90166666666667 0 2.71666666666667 7.30166666666667 4.935 6.835 8.95166666666667 11.625 13.9416666666667 18.6083333333333;
21.5066666666667 18.3183333333333 15.8016666666667 13.385 12.275 9.79166666666667 6.61833333333333 2.71666666666667 0 5.03333333333333 7.4 9.55166666666667 11.6683333333333 14.3416666666667 16.6583333333333 21.325;
18.3216666666667 15.1333333333333 12.6166666666667 10.2 10.25 12.7333333333333 10.1666666666667 7.30166666666667 5.03333333333333 0 2.36666666666667 6.36666666666667 8.48333333333333 11.1566666666667 13.4733333333333 18.14;
15.955 12.7666666666667 10.25 7.83333333333333 7.88333333333333 10.3666666666667 7.8 4.935 7.4 2.36666666666667 0 4 6.11666666666667 8.79 11.1066666666667 15.7733333333333;
14.905 11.7166666666667 9.2 6.78333333333333 6.83333333333333 9.31666666666667 6.75 3.885 6.60166666666667 3.41666666666667 1.05 2.95 5.06666666666667 7.74 10.0566666666667 14.7233333333333;
12.3716666666667 9.18333333333333 6.66666666666667 4.25 4.3 6.78333333333333 9.28333333333333 6.41833333333333 9.135 5.95 3.58333333333333 0.416666666666667 2.53333333333333 5.20666666666667 7.52333333333333 12.19;
11.955 8.76666666666667 7.08333333333333 4.66666666666667 4.71666666666667 7.2 9.7 6.835 9.55166666666667 6.36666666666667 4 0 2.11666666666667 4.79 7.10666666666667 11.7733333333333;
9.83833333333333 6.65 5.1 6.78333333333333 6.83333333333333 9.31666666666667 11.8166666666667 8.95166666666667 11.6683333333333 8.48333333333333 6.11666666666667 2.11666666666667 0 2.67333333333333 4.99 9.65666666666667;
8.905 5.71666666666667 4.16666666666667 6.58333333333333 7.76666666666667 10.25 12.75 9.885 12.6016666666667 9.41666666666667 7.05 3.05 0.933333333333333 1.74 4.05666666666667 8.72333333333333;
9.32 7.45666666666667 5.90666666666667 8.32333333333333 9.50666666666667 11.99 14.49 11.625 14.3416666666667 11.1566666666667 8.79 4.79 2.67333333333333 0 2.31666666666667 6.98333333333333;
7.00333333333333 9.77333333333333 8.22333333333333 10.64 11.8233333333333 14.3066666666667 16.8066666666667 13.9416666666667 16.6583333333333 13.4733333333333 11.1066666666667 7.10666666666667 4.99 2.31666666666667 0 4.66666666666667;
2.33666666666667 5.525 8.875 11.2916666666667 13.0416666666667 15.525 18.6983333333333 18.6083333333333 21.325 18.14 15.7733333333333 11.7733333333333 9.65666666666667 6.98333333333333 4.66666666666667 0];

EmptyBinReachT = [SxT(find(SxT(:,3)==2),1:2); SxT(end,1:2)] / 60;
BinEmptyTime = mean(EmptyBinReachT(1:NBins,2) - EmptyBinReachT(1:NBins,1));

% performance metrics

NAlarm = 0;
NAlarmXbin = zeros(NBins, 1);

NOverflowIncident = 0;
TotalOverflowTime = [];

OtherBinStats = zeros(NBins, 4);


% simulation run
tic
for simrun = 1:NRuns

	StartCycle = 0;

	BinStartOverflow = zeros(NBins, 1);
	RunOtherBinStats = zeros(NBins, 3);

	BinModState = ones(NBins, 1);
	BinLevel =  zeros(NBins, 1);
	BinState = ones(NBins, 1);
	T = 0;

	LastTimeBinWasVisited =  zeros(NBins, 1);

	NextBinToEmpty = 1;
	GarbageCollectorState = 1;
	AlarmCausedBy = 0;
	AlarmNodeIsReachedAt = 0;
	InterruptedAt = 0;

	NextSamp = TSamp;
	iSamp = 2;

	out = [T; BinLevel; BinModState; BinState; GarbageCollectorState; NextBinToEmpty];

	nCyc = 0;
	nCycMax = 200000;

	while (T < TMax)
		ModSt1 = find(BinModState == 1);
		ModSt2 = find(BinModState == 2);
		NModSt1 = size(ModSt1,1);
		TotRate = NModSt1 * G1 + (NBins - NModSt1) * G2;
		DeltaT = - log(rand()) / TotRate;	
		
		Time2Thr = T + ([BinThr, 1] - BinLevel) ./ (R1 * (BinModState == 1) + R2 * (BinModState == 2));
		nextChange = 1;		% next change caused by a modulation state variation
		binId = 0;
		
		BinState1Ids = find(BinState == 1);
		if(size(BinState1Ids,1) > 0)
			[ThMin, minId] = min(Time2Thr(BinState1Ids,1));
			if(ThMin < T + DeltaT)
				nextChange = 2;		% next change caused by a threshold being reached
				DeltaT = ThMin - T;
				binId = BinState1Ids(minId);
			end
		end
		
		BinState2Ids = find(BinState == 2);
		if(size(BinState2Ids,2) > 0)
			[ThMin, minId] = min(Time2Thr(BinState2Ids,2));
			if(ThMin < T + DeltaT)
				nextChange = 3;		% next change caused by an overflow
				DeltaT = ThMin - T;
				binId = BinState2Ids(minId);
			end
		end
		
		if(GarbageCollectorState == 1)	% GC is moving
			if(StartCycle + EmptyBinReachT(NextBinToEmpty,1) < T + DeltaT)
				nextChange = 4;		% next change caused by an empty bin event
				DeltaT = StartCycle + EmptyBinReachT(NextBinToEmpty,1) - T;
			end
		end
		
		if((GarbageCollectorState == 2) || (GarbageCollectorState == 0)  || (GarbageCollectorState == 4))	% GC is emptying a bin or waiting
			if(StartCycle + EmptyBinReachT(NextBinToEmpty,2) < T + DeltaT)
				nextChange = 5;		% next change caused by an empty bin finish event
				DeltaT = StartCycle + EmptyBinReachT(NextBinToEmpty,2) - T;
			end
		end

		if(GarbageCollectorState == 5)	% GC is reaching an alarm
			if(AlarmNodeIsReachedAt < T + DeltaT)
				nextChange = 6;		% next change caused by an empty bin who raised an alarm event
				DeltaT = AlarmNodeIsReachedAt - T;
			end
		end
		
		if(GarbageCollectorState == 6)	% GC is emptying a bin that rang the alarm
			if(AlarmNodeIsReachedAt + BinEmptyTime < T + DeltaT)
				nextChange = 7;		% next change caused by an empty bin who raised an alarm event
				DeltaT = AlarmNodeIsReachedAt + BinEmptyTime - T;
			end
		end		
	%[nCyc, DeltaT, nextChange]
	%[BinLevel, BinState]

	if(DeltaT < -10^-6)
		"Error!"
		fprintf(1,"[DT, T, StCy, NChg, GCSt, NBin");
		[DeltaT, T, StartCycle, nextChange, GarbageCollectorState, NextBinToEmpty]
		return
	end

		newT = T + DeltaT;
		
		HandleGCState5 = 0;

		sBinLevel = BinLevel + (NextSamp - T) * (R1 * (BinModState == 1) + R2 * (BinModState == 2));
		while NextSamp < newT
	%[NextSamp, newT]
			out(:, iSamp) = [NextSamp; min(sBinLevel,1); BinModState; BinState; GarbageCollectorState; NextBinToEmpty];
			iSamp    = iSamp    + 1;
			NextSamp = NextSamp + TSamp;
			sBinLevel = sBinLevel + TSamp * (R1 * (BinModState == 1) + R2 * (BinModState == 2));
		end
		
		BinLevel = BinLevel + DeltaT * (R1 * (BinModState == 1) + R2 * (BinModState == 2));

		if(nextChange == 1)
			r = TotRate * rand();
			if (r < NModSt1 * G1)	% jump from 1 to 2
				id = floor(r / G1)+1;
				BinModState(ModSt1(id,1), 1) = 2;
			else					% jump from 2 to 1
				id = floor((r - NModSt1 * G1) / G2)+1;
				BinModState(ModSt2(id,1), 1) = 1;
			end
		elseif(nextChange == 2)
			BinState(binId, 1) = 2;
			NAlarm = NAlarm + 1;
			NAlarmXbin(binId, 1) = NAlarmXbin(binId, 1) + 1;
			
			if HandleAlarm == 1			% GC handles alarms
				if (AlarmCausedBy == 0)
					AlarmCausedBy = binId;
				end
				if((GarbageCollectorState == 0) || (GarbageCollectorState == 1))
					GarbageCollectorState = 5;
					HandleGCState5 = 1;
				elseif (GarbageCollectorState == 2)
					GarbageCollectorState = 4;
				end
			end
			
		elseif(nextChange == 3)
			BinState(binId, 1) = 3;
			NOverflowIncident = NOverflowIncident + 1;
			BinStartOverflow(binId, 1) = newT;
		elseif(nextChange == 4)
			if (NextBinToEmpty < 16)
				GarbageCollectorState = 2;
				BinState(NextBinToEmpty) = 4;
				if(BinStartOverflow(NextBinToEmpty, 1) > 0)	% bin was overflowing
					TotalOverflowTime(end+1,:) = [newT - BinStartOverflow(NextBinToEmpty, 1), NextBinToEmpty];
					BinStartOverflow(NextBinToEmpty, 1) = 0;
				end
			else
				GarbageCollectorState = 0;
			end
		elseif(nextChange == 5)
	%[NextBinToEmpty, GarbageCollectorState]
			if(GarbageCollectorState == 4)
				GarbageCollectorState = 5;
				HandleGCState5 = 1;
			else
				GarbageCollectorState = 1;
			end
			if (NextBinToEmpty < 16)
				BinState(NextBinToEmpty) = 1;
				BinLevel(NextBinToEmpty) = 0;
				
				RunOtherBinStats(NextBinToEmpty,1) = RunOtherBinStats(NextBinToEmpty,1) + 1;
				InterBinTime = newT - LastTimeBinWasVisited(NextBinToEmpty);
				RunOtherBinStats(NextBinToEmpty,2) = RunOtherBinStats(NextBinToEmpty,2) + InterBinTime;
				RunOtherBinStats(NextBinToEmpty,3) = RunOtherBinStats(NextBinToEmpty,3) + InterBinTime^2;
				LastTimeBinWasVisited(NextBinToEmpty) = newT;
				
				NextBinToEmpty = NextBinToEmpty + 1;
			else
				NextBinToEmpty = 1;
				StartCycle = newT;
			end
		elseif(nextChange == 6)
			GarbageCollectorState = 6;		% Empty alarmed bin	
			BinState(NextBinToEmpty) = 4;			
			if(BinStartOverflow(NextBinToEmpty, 1) > 0)	% bin was overflowing
				TotalOverflowTime(end+1,:) = [newT - BinStartOverflow(NextBinToEmpty, 1), NextBinToEmpty];
				BinStartOverflow(NextBinToEmpty, 1) = 0;
			end
		else
			BinState(NextBinToEmpty) = 1;
			BinLevel(NextBinToEmpty) = 0;

			RunOtherBinStats(NextBinToEmpty,1) = RunOtherBinStats(NextBinToEmpty,1) + 1;
			InterBinTime = newT - LastTimeBinWasVisited(NextBinToEmpty);
			RunOtherBinStats(NextBinToEmpty,2) = RunOtherBinStats(NextBinToEmpty,2) + InterBinTime;
			RunOtherBinStats(NextBinToEmpty,3) = RunOtherBinStats(NextBinToEmpty,3) + InterBinTime^2;
			LastTimeBinWasVisited(NextBinToEmpty) = newT;
			
			OtherAlarmsCount   = sum(BinState == 2);
			OtherOverflowCount = sum(BinState == 3);
			TotalOtherBinEventsCount = OtherAlarmsCount + OtherOverflowCount;
			StartCycle = newT - EmptyBinReachT(NextBinToEmpty,2);
			
			if(TotalOtherBinEventsCount > 0)	% Other alarms to handle
				if(OtherOverflowCount > 0)			% priority to overflow
%					fprintf(1, "Overflow!\n");
					OVBin = find(BinState == 3);
					OVBinToGo = OVBin(floor(rand()*size(OVBin,1)+1));
				else
%					fprintf(1, "Alarm!\n");
					OVBin = find(BinState == 2);
					OVBinToGo = OVBin(floor(rand()*size(OVBin,1)+1));
				end
				AlarmCausedBy = OVBinToGo;
				HandleGCState5 = 1;
				GarbageCollectorState = 5;
			else
				GarbageCollectorState = 1;
				HandleGCState5 = 0;
				if(ContinueFromWhereItStopped == 1)
					LastBinEmptied = NextBinToEmpty;
					StartCycle = newT - InterruptedAt;
					NextBinToEmpty = sum(EmptyBinReachT(:,2) < InterruptedAt) + 1;
					if(NextBinToEmpty==17)
						NextBinToEmpty = 1;
					end
					if(abs(InterruptedAt-EmptyBinReachT(NextBinToEmpty,2)) < 10e-7) % Handle state 4 alarms
						NextBinToEmpty = NextBinToEmpty + 1;
%fprintf(1,"Case 4 Alarm\n");
					end
					if(InterruptedAt > EmptyBinReachT(16,1)) % Handles alarm during waiting
						NextBinToEmpty = 16;
						GarbageCollectorState = 0;
						HandleGCState5 = 0;
%fprintf(1,"W Alarm\n");
					end
%fprintf(1,"[newT, StCy, IntAt[h], IntAt[min], NBin, HS5");
%[newT, StartCycle, InterruptedAt, InterruptedAt*60, NextBinToEmpty, HandleGCState5]
					InterruptedAt = 0;
				else
					NextBinToEmpty = NextBinToEmpty + 1;
				end
			end
		end
		
		T = newT;
		
		if HandleGCState5 == 1
		  if false
			fprintf(1, "\nHandling Garbage Collector Alarm Call\n");
			CurCT = (T - StartCycle) * 60;
			fprintf(1, "Cycle position: %g\n", CurCT);
			ShortestPathRow = SxT(find((SxT(:,1) < CurCT) .* (SxT(:,2) >= CurCT)), 5);
			fprintf(1, "Shortest path row: %d\n", ShortestPathRow);
			fprintf(1, "Alarm caused by: %d\n", AlarmCausedBy);
			TimeToReachAlarm = ReachT(ShortestPathRow, AlarmCausedBy+1);
			fprintf(1, "Time to reach the alarm: %g minutes\n", TimeToReachAlarm);
			TimeToReachAlarm = ReachT(ShortestPathRow, AlarmCausedBy+1)/60;
			fprintf(1, "Time to reach the alarm: %g hours\n", TimeToReachAlarm);
			fprintf(1, "Current time: %g. Destination will be reached at: %g .\n", T, T + TimeToReachAlarm);
		  else
			CurCT = (T - StartCycle) * 60;
			ShortestPathRow = SxT(find((SxT(:,1) < CurCT) .* (SxT(:,2) >= CurCT)), 5);
			TimeToReachAlarm = ReachT(ShortestPathRow, AlarmCausedBy+1)/60;
			AlarmNodeIsReachedAt = T + TimeToReachAlarm;
		  end
			if (InterruptedAt == 0)
				InterruptedAt = T - StartCycle;
			end
			NextBinToEmpty = AlarmCausedBy;
			AlarmCausedBy = 0;
		end
		
		nCyc = nCyc + 1;
		if nCyc > nCycMax
			return
		end
	end
	NStillOverflowBins = sum(BinStartOverflow > 0);
	if(NStillOverflowBins > 0)
		StillOverflowBins = find(BinStartOverflow > 0);
%fprintf(1,"Some bins still in overflow:\n");
%[find(BinStartOverflow > 0),BinStartOverflow(find(BinStartOverflow > 0))]
		TotalOverflowTime(end+1:end+NStillOverflowBins,:) = [TMax - BinStartOverflow(StillOverflowBins, 1), StillOverflowBins];
	end
	
	OtherBinStats(:,1) = OtherBinStats(:,1) + RunOtherBinStats(:,1);
	OtherBinStats(:,2) = OtherBinStats(:,2) + RunOtherBinStats(:,1).^2;
	OtherBinStats(:,3) = OtherBinStats(:,3) + RunOtherBinStats(:,2);
	OtherBinStats(:,4) = OtherBinStats(:,4) + RunOtherBinStats(:,3);
end

toc

subplot(3,2,1);
plot(out(1,:), out(2:16,:), "-");
hold on
plot([0 TMax],[1 1],"black--");
plot([0 TMax],[BinThr BinThr],"red-.");
hold off
axis([0 TMax 0 1.2]);

subplot(3,2,2);
yyaxis left
plot(out(1,:), out(47,:), "-")
yyaxis right
plot(out(1,:), out(48,:), "-");
legend("State", "Bin");
legend('Location', 'northwest');

subplot(3,2,3);
plot(out(1,:), out(32:35,:), "-");
legend("1","2","3","4");
subplot(3,2,4);
plot(out(1,:), out(36:39,:), "-");
legend("5","6","7","8");
subplot(3,2,5);
plot(out(1,:), out(40:43,:), "-");
legend("9","A","B","C");
subplot(3,2,6);
plot(out(1,:), out(44:46,:), "-");
legend("D","E","F");



fprintf(1, "N.Alarms per day: %g\n", NAlarm / NRuns);
for i=1:NBins
	fprintf(1, "N.Alarms per day for bin %d: %g\n", i, NAlarmXbin(i,1) / NRuns);
end
fprintf(1, "\nN.Overflows per day: %g\n", NOverflowIncident / NRuns);
if(size(TotalOverflowTime,1) > 0)
	fprintf(1, "Average Overflow length: %g\n", mean(TotalOverflowTime(:,1)));
end

[OtherBinStats(:,1) / NRuns, sqrt(OtherBinStats(:,2) / NRuns - (OtherBinStats(:,1) / NRuns).^2), OtherBinStats(:,3) ./ OtherBinStats(:,1), sqrt(OtherBinStats(:,4) ./ OtherBinStats(:,1) - (OtherBinStats(:,3) ./ OtherBinStats(:,1)).^2)]