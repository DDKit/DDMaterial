/*
 * Copyright (C) 2015 - 2018, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

public protocol CollectionViewDelegate: UICollectionViewDelegate {}

public protocol CollectionViewDataSource: UICollectionViewDataSource {
  /**
   Retrieves the data source items for the collectionView.
   - Returns: An Array of DataSourceItem objects.
   */
  var dataSourceItems: [DataSourceItem] { get }
}

extension UIViewController {
  /**
   A convenience property that provides access to the CollectionViewController.
   This is the recommended method of accessing the CollectionViewController
   through child UIViewControllers.
   */
  public var collectionViewController: CollectionViewController? {
    return traverseViewControllerHierarchyForClassType()
  }
}

open class CollectionViewController: ViewController {
  /// A reference to a Reminder.
    public let collectionView = CollectionView()
  
  open var dataSourceItems = [DataSourceItem]()
  
  open override func prepare() {
    super.prepare()
    prepareCollectionView()
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    layoutCollectionView()
  }
}

extension CollectionViewController {
  /// Prepares the collectionView.
  fileprivate func prepareCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    view.layout(collectionView).edges()
  }
}

extension CollectionViewController {
  /// Sets the frame for the collectionView.
  fileprivate func layoutCollectionView() {
    collectionView.frame = view.bounds
  }
}

extension CollectionViewController: CollectionViewDelegate {}

extension CollectionViewController: CollectionViewDataSource {
  @objc
  open func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  @objc
  open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSourceItems.count
  }
  
  @objc
  open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
  }
}
