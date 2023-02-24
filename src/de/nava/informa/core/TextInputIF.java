//
// Informa -- RSS Library for Java
// Copyright (c) 2002 by Niko Schmuck
//
// Niko Schmuck
// http://sourceforge.net/projects/informa
// mailto:niko_schmuck@users.sourceforge.net
//
// This library is free software.
//
// You may redistribute it and/or modify it under the terms of the GNU
// Lesser General Public License as published by the Free Software Foundation.
//
// Version 2.1 of the license should be included with this distribution in
// the file LICENSE. If the license is not included with this distribution,
// you may find a copy at the FSF web site at 'www.gnu.org' or 'www.fsf.org',
// or you may write to the Free Software Foundation, 675 Mass Ave, Cambridge,
// MA 02139 USA.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied waranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//


// $Id: TextInputIF.java,v 1.8 2004/03/09 20:17:27 niko_schmuck Exp $

package de.nava.informa.core;

/**
 * This interface is implemented by objects representing an text input
 * field assigned to a channel in the news channel object model. This
 * could be typically used for executing a search on the web site linked
 * to.</p>
 *
 * @author Niko Schmuck (niko@nava.de)
 */
public interface TextInputIF extends WithIdMIF, WithTitleMIF, WithNameMIF, WithDescriptionMIF, WithLinkMIF {

}
