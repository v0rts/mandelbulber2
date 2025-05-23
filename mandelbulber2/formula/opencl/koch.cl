/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2025 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * KochIteration
 * Based on Knighty's Kaleidoscopic IFS 3D Fractals, described here:
 * http://www.fractalforums.com/3d-fractal-generation/kaleidoscopic-%28escape-time-ifs%29/

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_koch.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 KochIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL col = 0.0f;
	REAL temp = 0.0f;
	z.x = fabs(z.x);
	z.y = fabs(z.y);
	if (z.y > z.x)
	{
		temp = z.x;
		z.x = z.y;
		z.y = temp;
		col += fractal->foldColor.difs0000.x;
	}

	REAL YOff = FRAC_1_3_F * fractal->transformCommon.scale1;
	z.y = YOff - fabs(z.y - YOff);

	z.x += FRAC_1_3_F;
	if (z.z > z.x)
	{
		temp = z.x;
		z.x = z.z;
		z.z = temp;
		col += fractal->foldColor.difs0000.y;
	}
	z.x -= FRAC_1_3_F;

	z.x -= FRAC_1_3_F;
	if (z.z > z.x)
	{
		temp = z.x;
		z.x = z.z;
		z.z = temp;
		col += fractal->foldColor.difs0000.z;
	}
	z.x += FRAC_1_3_F;

	REAL4 Offset = fractal->transformCommon.offset100;
	z = fractal->transformCommon.scale3 * (z - Offset) + Offset;
	aux->DE = aux->DE * fractal->transformCommon.scale3;

	// rotation
	if (fractal->transformCommon.functionEnabledRFalse
			&& aux->i >= fractal->transformCommon.startIterationsR
			&& aux->i < fractal->transformCommon.stopIterationsR)
	{
		z = Matrix33MulFloat4(fractal->transformCommon.rotationMatrix, z);
	}

	REAL colDist = aux->dist;
	aux->dist = fabs(length(z) - length(Offset));
	aux->dist = aux->dist / aux->DE;

	if (fractal->foldColor.auxColorEnabledFalse && aux->i >= fractal->foldColor.startIterationsA
			&& aux->i < fractal->foldColor.stopIterationsA)
	{
		if (colDist != aux->dist) aux->color += col;
		//	aux->color += col;
	}

	return z;
}